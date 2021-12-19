// ignore_for_file: file_names, unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:los_chifrudos/Telas/boas_vindas.dart';
import 'package:los_chifrudos/Telas/classificador_api_rest.dart';
import 'package:los_chifrudos/dashboard_pages/escolas.dart';
import 'cadastro.dart';
import 'TelaEntrar.dart';
import 'aprovacao_escolar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'classificacao.dart';

// ignore: use_key_in_widget_constructors
class NavDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'MeNota.Ai',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Dashboards Situação Escolas'),
                onTap: ()  => {
                  Navigator.pop(context),
                  Navigator.pushNamed(
                    context, DashboardEscolas.id
                  ),
                }),
            ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Aprovação escolar'),
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aprovacao()));
                }),
            ListTile(
                leading: const Icon(Icons.class__outlined),
                title: const Text('Algoritmo Classificação'),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequestApi()),
                  );
                }),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () => {
                _auth.signOut(),
                Navigator.popUntil(context, ModalRoute.withName(HomeWelcome.id)),
              },
            ),
          ],
        ),
      );
    } else {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'MeNota.Ai',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Entrar/Cadastro'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, Entrar.id)
              },
            ),
          ],
        ),
      );
    }
  }
}
