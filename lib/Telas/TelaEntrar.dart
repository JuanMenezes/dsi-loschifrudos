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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left:4, top:10, right: 4, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 30),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Colors.white
                  ),
                  onPressed: () async {
                    try {
                      await _auth.signInWithEmailAndPassword (email: email, password: senha);
                      Navigator.pushNamed(context, Dashboard.id);
                      Navigator.pop(context);
                    } on Exception catch (e) {
                      print (e);
                    }
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                ElevatedButton(
                  child: const Text("Cadastro",
                      style: TextStyle(color: Colors.purple)),
                  onPressed: () => {
                    Navigator.pushNamed(context, TelaCadastro.id),
                    Navigator.pop(context)
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}