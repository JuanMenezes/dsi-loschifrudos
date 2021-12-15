import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Telas/cadastro.dart';
import 'Telas/TelaEntrar.dart';
import 'Telas/dashboard.dart';
import 'dashboards_pages/escolas.dart';
import 'Telas/boas_vindas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              DashboardEscolas(title: "Dashboarda das escolas"),
          HomeWelcome.id: (context) =>
              HomeWelcome(title: "Tela Inicial Explicando o App")
        });
  }
}
