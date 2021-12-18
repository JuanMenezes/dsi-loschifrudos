import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Telas/boas_vindas.dart';
import 'Telas/cadastro.dart';
import 'Telas/TelaEntrar.dart';
import 'Telas/dashboard.dart';
import 'dashboard_pages/escolas.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MeNota.Ai',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: HomeWelcome.id,
        routes: {
          Entrar.id: (context) => const Entrar(title: 'MeNota.Ai'),
          TelaCadastro.id: (context) => TelaCadastro(),
          Dashboard.id: (context) => Dashboard(title: "Dashboard"),
          DashboardEscolas.id: (context) =>
              DashboardEscolas(title: "Dashboard das escolas"),
          HomeWelcome.id: (context) =>
              HomeWelcome(title: "Tela Inicial Explicando o App")
        });
  }
}
