import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:microblog/model/Usuario.dart';
import 'package:microblog/servicos/ServicosDoMicroBlog.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase with Store {
  Usuario mUsuarioLogado;
  ServicosDoMicroBlog mService = GetIt.I.get<ServicosDoMicroBlog>();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void verificarSeTemUsuario(
      {Function() temUsuario, Function() naoTemUsuario}) {
    _prefs.then((db) {
      //db.setString("user", null); // Comando utilizado para deletar usuário local - usado sempre ao fazer teste
      var usuarioJson = db.getString("user");
      if (usuarioJson != null) {
        mUsuarioLogado = Usuario.fromJson(JsonCodec().decode(usuarioJson));
        temUsuario?.call();
      } else {
        naoTemUsuario?.call();
      }
    });
  }

  void cadastrarUsuario(Usuario usuarioCadastrar,
      {Function() sucesso, Function(String mensagem) erro}) {
    if (usuarioCadastrar.email?.isEmpty ?? true) {
      erro?.call("E-mail invalido");
    } else if (usuarioCadastrar.senha?.isEmpty ?? true) {
      erro?.call("Defina uma senha");
    } else if (usuarioCadastrar.nome?.isEmpty ?? true) {
      erro?.call("Defina seu nome");
    } else {
      mService.cadastrarUsuario(usuarioCadastrar).then((usuario) {
        _prefs.then((db) {
          db.setString("user", JsonCodec().encode(usuario.toJson()));
          sucesso?.call();
        });
      }).catchError((onError) {
        erro?.call(onError.response.data["falha"]);
      });
    }
  }

  void logarUsuario(Usuario usuarioLogar,
      {Function sucesso, Function(String mensagem) erro}) {
    if ((usuarioLogar.email?.isEmpty ?? true) ||
        (usuarioLogar.senha?.isEmpty ?? true)) {
      erro?.call("Usuário ou senha invalidos");
    } else {
      mService
          .logarUsuario(usuarioLogar.email, usuarioLogar.senha)
          .then((usuario) {
        _prefs.then((db) {
          db.setString("user", JsonCodec().encode(usuario.toJson()));
          sucesso?.call();
        });
      }).catchError((onError) {
        erro?.call(onError.response?.data["falha"]);
      });
    }
  }
}
