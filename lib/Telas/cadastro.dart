// ignore_for_file: must_be_immutable, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'TelaEntrar.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaCadastro extends StatelessWidget {
  static String id = 'cadastro';
  final _auth = FirebaseAuth.instance;
  late String email;
  late String nome;
  late String senha;

  TelaCadastro({Key? key}) : super(key: key);
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Usuarios');




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  onChanged: (value) {
                    nome = value;
                  },
                  decoration: const InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  onChanged: (value) {
                    senha = value;
                  },
                  decoration: const InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const Divider(),
                ButtonTheme(
                  minWidth: 20.0,
                  height: 30.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        primary: Colors.white),
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.purple),
                    ),
                    onPressed: () async {
                      try {
                        await _auth
                            .createUserWithEmailAndPassword(
                            email: email, password: senha);
                        final userId = _auth.currentUser!.uid;
                        _collectionReference.doc(userId).set({
                          "name" : nome,
                          "email": email,
                        });
                        Navigator.pushNamed(context, Dashboard.id);
                        Navigator.pop(context);
                      } catch (e) {
                        print (e);
                      }
                    },
                  ),
                )
              ])),
    );
  }
}
