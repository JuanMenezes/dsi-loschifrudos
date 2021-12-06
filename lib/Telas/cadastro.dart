import 'package:flutter/material.dart';
import 'tela_inicial.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaCadastro extends StatelessWidget {
  static String id = 'cadastro';

  final _auth = FirebaseAuth.instance;
  late String cpf;
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
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      onChanged: (value) {
                        cpf = value;
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
                                email: cpf, password: senha);
                            Navigator.pushNamed(context, HomeScreen.id);
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
