// ignore_for_file: must_be_immutable, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'TelaEntrar.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaCadastro extends StatelessWidget {
  static String id = 'cadastro';
  final _auth = FirebaseAuth.instance;
  late String email;
  late String nome;
  late String senha;

  TelaCadastro({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
          padding: const EdgeInsets.all(9),
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                        onPressed: () async {
                          try {
                            await _auth
                                .createUserWithEmailAndPassword(
                                email: email, password: senha);
                            Navigator.pushNamed(context, Dashboard.id);
                          } catch (e) {
                            print (e);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.white),
                        child: const Text(
                          "Salvar",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    )
                  ]))),
    );
  }
}
