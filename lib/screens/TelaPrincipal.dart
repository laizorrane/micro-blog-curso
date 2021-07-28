import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/util/PublicacaoWidget.dart';
import 'package:microblog/util/UtilDialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:microblog/util/StatusConsulta.dart';

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ControladorFeed _controladorFeed = GetIt.I.get<ControladorFeed>();
  _consultarFeed() {
    _controladorFeed.consultarOFeed(sucesso: () {
      Navigator.pop(context);
      _refreshController.refreshCompleted();
    }, erro: (mensagem) {
      Navigator.pop(context);
      _refreshController.refreshFailed();
    }, carregando: () {
      UtilDialog.showLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(),
        onRefresh: _consultarFeed,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              PublicacaoWidget(),
              Observer(builder: (_) {
                switch (_controladorFeed.mStatusConsultaFeed) { 
                  case StatusConsulta.CARREGANDO:
                    return Text("Aguarde, estou consultando...");
                    break;
                  case StatusConsulta.SUCESSO:
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          children: [
                            Text("Nome de quem postou"),
                            Text("Conteudo da publicação"),
                          ],
                        ));
                      },
                      itemCount: _controladorFeed.mPostagens.length,
                      shrinkWrap: true,
                    );
                    break;
                  case StatusConsulta.FALHA:
                    return Text("Ops! Não consegui carregar");
                    break;
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
