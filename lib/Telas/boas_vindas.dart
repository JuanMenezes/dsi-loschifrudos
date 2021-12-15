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
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[],
          staggeredTiles: const [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
    );
  }
}
