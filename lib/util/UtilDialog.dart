import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/model/Postagem.dart';
import 'package:microblog/util/BotaoPadrao.dart';
import 'package:microblog/util/PublicacaoWidget.dart';

class UtilDialog {
  static ControladorFeed _controladorFeed = GetIt.I.get<ControladorFeed>();

  static void exibirInformacao(BuildContext context,
      {String titulo, String mensagem}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$titulo",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text("$mensagem"),
                  SizedBox(
                    height: 16,
                  ),
                  BotaoPadrao(
                    value: "Ok, entendido",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static void excluirPub(BuildContext mainContext, Postagem postagem) {
    showDialog(
      context: mainContext,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Atenção, deseja excluir?"),
                  Divider(),
                  Text(
                    "${postagem.criador.nome}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text("${postagem.conteudo}"),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Expanded(
                          child: BotaoPadrao(
                            value: "Confirmar",
                            onTap: () {
                              _controladorFeed.excluirPostagem(
                                postagem,
                                carregando: () {
                                  Navigator.pop(mainContext);
                                  showLoading(mainContext);
                                },
                                sucesso: () {
                                  Navigator.pop(mainContext);
                                  exibirInformacao(mainContext,
                                      titulo: "Sucesso!",
                                      mensagem: "A publicação foi excluida");
                                },
                                erro: (mensagem) {
                                  Navigator.pop(mainContext);
                                  exibirInformacao(mainContext,
                                      titulo: "Ops!", mensagem: mensagem);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: BotaoPadrao(
                            value: "Cancelar",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void editarPub(BuildContext mainContext, Postagem postagem) {
    showDialog(
      context: mainContext,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Atenção, você está editando!"),
                  Divider(),
                  PublicacaoWidget(
                      postagemEditar: postagem,
                      sucesso: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
