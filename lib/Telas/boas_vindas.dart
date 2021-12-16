// ignore_for_file: sized_box_for_whitespace, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:los_chifrudos/Telas/Menu.dart';

class HomeWelcome extends StatefulWidget {
  HomeWelcome({required this.title});
  static String id = 'HomeWelcome';

  final String title;

  @override
  _HomeWelcome createState() => _HomeWelcome();
}

class _HomeWelcome extends State<HomeWelcome> {
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
        title: Text(""),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              'Bem vindo ao MeNota.Ai',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..strokeWidth = 6
                  ..color = Colors.white,
              ),
            )),
            Center(
                child: Text('Para seguir, por favor faça cadastro ou login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..strokeWidth = 6
                        ..color = Colors.white,
                    ))),
          ],
          //staggeredTiles: const [
          //StaggeredTile.extent(4, 250.0),
          //StaggeredTile.extent(2, 250.0),
          //StaggeredTile.extent(2, 120.0),
          //StaggeredTile.extent(2, 120.0),
          //StaggeredTile.extent(4, 250.0),
          //
          //],
        ),
      ),
    );
  }
}
