import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microblog/Controladores/ControladorFeed.dart';
import 'package:microblog/screens/TelaCadastro.dart';
import 'package:microblog/screens/TelaLogin.dart';
import 'package:microblog/screens/TelaPrincipal.dart';
import 'package:microblog/screens/TelaSplash.dart';
import 'package:microblog/servicos/ServicosDoMicroBlog.dart';

import 'Controladores/ControladorUsuario.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(ServicosDoMicroBlog(Dio()));
  getIt.registerLazySingleton(() => ControladorUsuario());
  getIt.registerSingleton(ControladorFeed());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Primeiro App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => TelaSplash(),
        "/telaLogin": (_) => TelaLogin(),
        "/telaPrincipal": (_) => TelaPrincipal(),
        "/telaDeCadastro": (_) => TelaDeCadastro(),
       
      },
    );
  }
}
