import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/model/Postagem.dart';
import 'package:microblog/util/BotaoPadrao.dart';
import 'package:microblog/util/TextFieldPadraoExp.dart';
import 'package:microblog/util/UtilDialog.dart';

class PublicacaoWidget extends StatefulWidget {
  final Postagem postagemEditar;
  final Function() sucesso;
  const PublicacaoWidget({Key key, this.postagemEditar, this.sucesso})
      : super(key: key);

  @override
  _PublicacaoWidgetState createState() => _PublicacaoWidgetState();
}

class _PublicacaoWidgetState extends State<PublicacaoWidget> {
  ControladorFeed _controladorFeed = GetIt.I.get<ControladorFeed>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldPadraoExp(
              
              titulo: widget.postagemEditar != null
                  ? "Editar Postagem"
                  : "Digite sua publicação",
              value: widget.postagemEditar?.conteudo ??
                  _controladorFeed.conteudoPublicacao,
              onChanged: (text) {
                _controladorFeed.conteudoPublicacao = text;
              },
            ),
            Container(
              height: 16,  
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Observer(builder: (_) {
                  return Container(
                    width: 100,
                    height: 30,
                    child: BotaoPadrao(
                      background: Colors.blue,
                      value:
                          widget.postagemEditar != null ? "Editar" : "Publicar",
                      onTap: _controladorFeed.habilitadoAPostar
                          ? () {
                              _controladorFeed.publicarPostagem(
                                widget.postagemEditar,
                                sucesso: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                  widget.sucesso();
                                },
                                erro: (mensagem) {
                                  Navigator.pop(context);
                                  UtilDialog.exibirInformacao(context,
                                      titulo: "Ops!", mensagem: mensagem);
                                },
                                carregando: () {
                                  UtilDialog.showLoading(context);
                                },
                              );
                            }
                          : null,
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
