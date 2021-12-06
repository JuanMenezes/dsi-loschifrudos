import 'package:flutter/material.dart';
import 'cadastro.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  late String matricula;
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
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  onChanged: (value) {
                    matricula = value;
                  },
                  decoration: const InputDecoration(
                      labelText: "Matrícula",
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
                          onPressed: () => {

                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(210, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              primary: Colors.white),
                          child: const Text(
                            "Login",
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