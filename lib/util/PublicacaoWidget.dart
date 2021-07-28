import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/util/BotaoPadrao.dart';
import 'package:microblog/util/TextFieldPadrao.dart';

class PublicacaoWidget extends StatelessWidget {
  const PublicacaoWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ControladorFeed _controladorFeed = GetIt.I.get<ControladorFeed>();
    return Observer(
      builder: (_) {
        var habilitado = _controladorFeed.habilitadoAPostar;
        return Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFieldPadrao(
                  titulo: "Digite sua publicação",
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
                    Container(
                      width: 100,
                      height: 30,
                      child: BotaoPadrao(
                        background: Colors.blue,
                        value: "Publicar",
                        onTap: habilitado ? () {} : null,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
