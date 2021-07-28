import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorUsuario.dart';
import 'package:microblog/model/Usuario.dart';
import 'package:microblog/util/BotaoPadrao.dart';
import 'package:microblog/util/TextFieldPadrao.dart';
import 'package:microblog/util/UtilDialog.dart';

class TelaDeCadastro extends StatefulWidget {
  TelaDeCadastro({Key key}) : super(key: key);

  @override
  _TelaDeCadastroState createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuario = Usuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Me cadastrar no micro-blog"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    Text("Faça já o seu cadastro"),
                    Divider(),
                    TextFieldPadrao(
                      titulo: "E-mail",
                      onChanged: (text) {
                        _usuario.email = text;
                      },
                    ),
                    TextFieldPadrao(
                      titulo: "Nome",
                      onChanged: (text) {
                        _usuario.nome = text;
                      },
                    ),
                    TextFieldPadrao(
                      titulo: "Senha",
                      obscureText: true,
                      onChanged: (text) {
                        _usuario.senha = text;
                      },
                    ),
                    Container(),
                    BotaoPadrao(
                      value: "Me registrar",
                      onTap: () {
                        _controladorUsuario.cadastrarUsuario(
                          _usuario,
                          sucesso: () {
                            Navigator.pushReplacementNamed(context, "/telaPrincipal");
                          },
                          erro: (mensagem) {
                            UtilDialog.exibirInformacao(context,
                                titulo: "Ops!", mensagem: mensagem);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
