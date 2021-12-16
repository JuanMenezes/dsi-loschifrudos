// ignore_for_file: sized_box_for_whitespace, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:los_chifrudos/Telas/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassificacaoResquest extends StatefulWidget {
  ClassificacaoResquest({required this.title});
  static String id = 'ClassificacaoResquest';

  final String title;

  @override
  _ClassificacaoResquest createState() => _ClassificacaoResquest();
}

class Data {
  final String ano;
  final int alunos;
  final Color barColor;

  Data(this.ano, this.alunos, this.barColor);
}

class _ClassificacaoResquest extends State<ClassificacaoResquest> {
  final _auth = FirebaseAuth.instance;

  void getUsuario() async {
    try {
      final user = _auth.currentUser!;
      print(user.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Algoritmo de classficação"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('VariaveisML').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var score2017 = snapshot.data!.docs[0]['score2017'];
              var score2018 = snapshot.data!.docs[0]['score2018'];
              var mediaInvestimento2017 =
                  snapshot.data!.docs[0]['mediaInvestimento2017'];
              return Container(
                  color: const Color(0xffE5E5E5),
                  child: StaggeredGridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    children: <Widget>[],
                  ));
            } else {
              return const Text('Loading...');
            }
          }),
    );
  }
}
