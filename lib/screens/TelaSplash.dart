import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorUsuario.dart';

class TelaSplash extends StatefulWidget {
  TelaSplash({Key key}) : super(key: key);

  @override
  TelaSplashState createState() => TelaSplashState();
}

class TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      GetIt.I.get<ControladorUsuario>().verificarSeTemUsuario(
        temUsuario: () {
          Navigator.pushReplacementNamed(context, "/telaPrincipal");
        },
        naoTemUsuario: () {
          Navigator.pushReplacementNamed(context, "/telaLogin");
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Carregando...",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    ));
  }
}
