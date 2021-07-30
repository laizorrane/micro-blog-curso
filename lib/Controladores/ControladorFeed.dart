import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorUsuario.dart';
import 'package:microblog/model/Postagem.dart';
import 'package:microblog/model/Usuario.dart';
import 'package:microblog/servicos/ServicosDoMicroBlog.dart';
import 'package:mobx/mobx.dart';
import 'package:microblog/util/StatusConsulta.dart';

part 'ControladorFeed.g.dart';

class ControladorFeed = _ControladorFeed with _$ControladorFeed;

abstract class _ControladorFeed with Store {
  ServicosDoMicroBlog mService = GetIt.I.get<ServicosDoMicroBlog>();

  @observable
  ObservableList<Postagem> mPostagens = ObservableList<Postagem>();

  @observable
  StatusConsulta mStatusConsultaFeed = StatusConsulta.CARREGANDO;

  @observable
  String conteudoPublicacao = "";

  @computed
  bool get habilitadoAPostar => conteudoPublicacao.isNotEmpty;

  void consultarOFeed(
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mStatusConsultaFeed = StatusConsulta.CARREGANDO;
    mService.consultarPublicacoes().then((responseTodasPublicacoes) {
      mPostagens.clear();
      mPostagens.addAll(responseTodasPublicacoes.sucesso);
      mStatusConsultaFeed = StatusConsulta.SUCESSO;
      sucesso?.call();
    }).catchError((onError) {
      mStatusConsultaFeed = StatusConsulta.FALHA;
      erro?.call(onError.response.data["falha"]);
    });
  }

  void publicarPostagem(Postagem postagem,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    if (postagem == null) {
      postagem = Postagem(
          conteudo: conteudoPublicacao,
          criador: GetIt.I.get<ControladorUsuario>().mUsuarioLogado);
    } else {
      postagem.conteudo = conteudoPublicacao;
    }
    carregando?.call();
    mService.manterPublicacao(postagem).then((value) {
      if (postagem.id == null)
        mPostagens.insert(0, value.sucesso);
      else {
        var index = mPostagens.indexWhere((post) => post.id == postagem.id);
        mPostagens.removeAt(index);
        mPostagens.insert(index, value.sucesso);
      }
      conteudoPublicacao = "";
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }

  void excluirPostagem(Postagem postagem,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mService.excluirPostagem(postagem.id).then((value) {
      mPostagens.removeWhere((post) => post.id == postagem.id);
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
      mStatusConsultaFeed = StatusConsulta.FALHA;
    });
  }

  bool temCurtida(Usuario usuario, Postagem postagem) {
    var indexUsuarioLike = postagem.likes == null
        ? -1
        : postagem.likes.indexWhere((element) => element.id == usuario.id);
    return indexUsuarioLike >= 0;
  }

  void likeOrDeslike(Usuario usuario, Postagem postagem,
      {Function() sucesso, Function(String mensagem) erro}) {
    if (temCurtida(usuario, postagem)) {
      removerLike(usuario, postagem);
    } else {
      darLike(usuario, postagem);
    }
  }

  void darLike(Usuario usuario, Postagem postagem,
      {Function() sucesso, Function(String mensagem) erro}) {
    mService.darLike(usuario, postagem.id).then((value) {
      var indexPostagem =
          mPostagens.indexWhere((element) => element.id == postagem.id);
      mPostagens.removeAt(indexPostagem);
      if (postagem.likes == null) postagem.likes = [];
      postagem.likes.add(usuario);
      mPostagens.insert(indexPostagem, postagem);

      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }

  void removerLike(Usuario usuario, Postagem postagem,
      {Function() sucesso, Function(String mensagem) erro}) {
    mService.removerLike(postagem.id, usuario.id).then((value) {
      var indexPostagem =
          mPostagens.indexWhere((element) => element.id == postagem.id);
      mPostagens.removeAt(indexPostagem);

      var indexUsuario = postagem.likes
          .indexWhere((usuarioLike) => usuarioLike.id == usuario.id);
      postagem.likes.removeAt(indexUsuario);

      mPostagens.insert(indexPostagem, postagem);

      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }
}
