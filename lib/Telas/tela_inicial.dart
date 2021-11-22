import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Padding(
          padding: EdgeInsets.all(9),
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Matrícula",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(210, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              primary: Colors.white),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.purple),
                          ),
                        )),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Cadastro",
                            style: TextStyle(color: Colors.purple)),
                        onPressed: () => {},
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

  void cadastro() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
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
      },
    ));
  }
}