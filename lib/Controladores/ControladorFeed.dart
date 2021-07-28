import 'package:get_it/get_it.dart';
import 'package:microblog/model/Postagem.dart';
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
}
