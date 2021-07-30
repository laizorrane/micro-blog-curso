import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/Controladores/ControladorUsuario.dart';
import 'package:microblog/model/MenuItem.dart';
import 'package:microblog/util/PublicacaoWidget.dart';
import 'package:microblog/util/UtilDataHora.dart';
import 'package:microblog/util/UtilDialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:microblog/util/StatusConsulta.dart';

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>
    with AfterLayoutMixin<TelaPrincipal> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ControladorFeed _controladorFeed = GetIt.I.get<ControladorFeed>();
  BuildContext mMainContext;

  @override
  void initState() {
    mMainContext = context;
    super.initState();
  }

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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                  "${_controladorUsuario.mUsuarioLogado.nome}",
                  style: TextStyle(fontSize: 20)),
              accountEmail: new Text(
                  "${_controladorUsuario.mUsuarioLogado.email}",
                  style: TextStyle(fontSize: 16)),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            Container(
              child: Column(children: <Widget>[
                MenuItem(
                  icon: Icons.home,
                  title: "Feed",
                  value: "Home",
                  clique: () {
                    Navigator.pushReplacementNamed(context, "/telaPrincipal");
                  },
                ),
                MenuItem(
                    icon: Icons.settings,
                    title: "Editar usuário",
                    value: "Home",
                    clique: () {
                      Navigator.pushReplacementNamed(
                          context, "/telaEditarUsuario");
                    }),
                MenuItem(
                  icon: Icons.exit_to_app,
                  title: "Sair",
                  value: "Sair",
                  clique: () {
                    _controladorUsuario.deslogarUsuario(
                      sucesso: () {
                        Navigator.pushReplacementNamed(context, "/telaLogin");
                      },
                    );
                  },
                )
              ]),
            )
          ],
        ),
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
                      primary: false,
                      itemBuilder: (context, index) {
                        var post = _controladorFeed.mPostagens[index];
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${post.criador.nome}"),
                                  Visibility(
                                    visible: post.isCriador,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              UtilDialog.editarPub(
                                                  mMainContext, post);
                                            }),
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              UtilDialog.excluirPub(
                                                  mMainContext, post);
                                            })
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(),
                              Text("${post.conteudo}"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  children: [
                                    InkWell(
                                        child: Icon(Icons.thumb_up_outlined,
                                            color: _controladorFeed.temCurtida(
                                                    _controladorUsuario
                                                        .mUsuarioLogado,
                                                    post)
                                                ? Colors.blue
                                                : Colors.black),
                                        onTap: () {
                                          _controladorFeed.likeOrDeslike(
                                            _controladorUsuario.mUsuarioLogado,
                                            post,
                                            sucesso: () {
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                          );
                                        }),
                                    Container(),
                                    Text(UtilDataHora.convertDateTime(
                                        post.dataDePostagem))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                      itemCount: _controladorFeed.mPostagens.length,
                      shrinkWrap: true,
                    );
                    break;
                  case StatusConsulta.FALHA:
                    return Text("Ops! Não consegui carregar");
                    break;
                  default:
                    return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _consultarFeed();
  }
}
