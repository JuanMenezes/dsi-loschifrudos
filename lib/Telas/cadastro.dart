import 'package:flutter/material.dart';


class TelaCadastro extends StatelessWidget {
  static String id = 'cadastro';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
          padding: EdgeInsets.all(9),
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "CPF",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Nome Completo",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                ButtonTheme(
                  minWidth: 20.0,
                  height: 30.0,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        primary: Colors.white),
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                )
              ]))),
    );
  }
}
