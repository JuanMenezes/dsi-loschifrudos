// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'TelaEntrar.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () => {
                _auth.signOut(),
                Navigator.of(context).pop()
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
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Entrar/Cadastro'),
              onTap: () => {Navigator.pushNamed(context, Entrar.id)},
            ),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      );
    }


  }
}