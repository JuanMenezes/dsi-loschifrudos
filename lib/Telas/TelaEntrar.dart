// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Entrar extends StatefulWidget {
  static String id = 'home_screen';
  const Entrar({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<Entrar> createState() => _Entrar();
}

class _Entrar extends State<Entrar> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Padding(
          padding: const EdgeInsets.all(9),
          child: Center(
            child: Column(
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
                Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await _auth.signInWithEmailAndPassword (email: email, password: senha);
                              Navigator.pushNamed(context, Dashboard.id);
                            } on Exception catch (e) {
                              print (e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(210, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              primary: Colors.white),
                          child: const Text(
                            "Entrar",
                            style: TextStyle(color: Colors.purple),
                          ),
                        )),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Cadastro",
                            style: TextStyle(color: Colors.purple)),
                        onPressed: () => {
                          Navigator.pushNamed(context, TelaCadastro.id)
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(210, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}