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
          padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                        labelText: "Matrícula",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),

                const Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const Divider(),
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
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.purple),
                          ),
                        )),
                    BotaoArrendondado(
                      color: Colors.white,
                      title: 'Cadastro',
                      onPressed: (){
                        Navigator.pushNamed(context, TelaCadastro.id);
                      },
                    ),
                  ],
                ),
              ],
            ),

        ));
  }

  void cadastro() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
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
                          decoration: const InputDecoration(
                              labelText: "Matrícula",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        const Divider(),
                        TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Nome Completo",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                              labelText: "Senha",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        const Divider(),
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
                            child: const Text(
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

class BotaoArrendondado extends StatelessWidget {
  BotaoArrendondado({this.color, this.title, @required this.onPressed});

  final color;
  final title;
  final onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(25.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 32.0,
          child: title,
        ),
      )
    );
  }
}



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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "CPF",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    Divider(),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "Nome Completo",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
