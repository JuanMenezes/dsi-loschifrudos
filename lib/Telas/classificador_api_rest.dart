import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<AlgoritmoCollab> createAlgoritmoCollab(
    String uri,
    String valorTotal,
    String quadra,
    String biblioteca,
    String refeitorio,
    String internet) async {
  final response = await http.post(Uri.http(uri, "/classifica_escola", {
    "valorTotalParam": valorTotal,
    "quadraParam": quadra,
    "bibliotecaParam": biblioteca,
    "refeitorioParam": refeitorio,
    "internetParam": internet,
  }));

  if (response.statusCode == 201 ||
      response.statusCode == 404 ||
      response.statusCode == 200) {
    return AlgoritmoCollab.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao se comunicar com o servidor');
  }
}

class AlgoritmoCollab {
  final String resultado;

  AlgoritmoCollab({required this.resultado});

  factory AlgoritmoCollab.fromJson(Map<String, dynamic> json) {
    return AlgoritmoCollab(
      resultado: json['escolaModelo'],
    );
  }
}

class RequestApi extends StatefulWidget {
  const RequestApi({Key? key}) : super(key: key);

  @override
  _RequestApiState createState() {
    return _RequestApiState();
  }
}

class _RequestApiState extends State<RequestApi> {
  final TextEditingController valorTotalController = TextEditingController();
  final TextEditingController quadraController = TextEditingController();
  final TextEditingController bibliotecaController = TextEditingController();
  final TextEditingController refeitorioController = TextEditingController();
  final TextEditingController internetController = TextEditingController();
  final TextEditingController uriController = TextEditingController();

  Future<AlgoritmoCollab>? _futureAlgoritmoCollab;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classificador de aprovação',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Resultado Classificador de Aprovação'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlgoritmoCollab == null)
              ? buildColumn()
              : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: uriController,
          decoration:
              const InputDecoration(hintText: 'Digite o URI da hospedagem'),
        ),
        TextFormField(
          controller: valorTotalController,
          decoration:
              const InputDecoration(hintText: 'Digite o valor total previsto'),
        ),
        TextFormField(
          controller: quadraController,
          decoration: const InputDecoration(
              hintText: 'Digite se tem QUADRA DE ESPORTES'),
        ),
        TextFormField(
          controller: bibliotecaController,
          decoration: const InputDecoration(
              hintText: 'Digite se tem BIBLIOTECA/SALA DE LEITURA'),
        ),
        TextFormField(
          controller: refeitorioController,
          decoration:
              const InputDecoration(hintText: 'Digite se tem REFEITORIO'),
        ),
        TextFormField(
          controller: internetController,
          decoration:
              const InputDecoration(hintText: 'Digite se tem IN_INTERNET'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlgoritmoCollab = createAlgoritmoCollab(
                  uriController.text,
                  valorTotalController.text,
                  quadraController.text,
                  bibliotecaController.text,
                  refeitorioController.text,
                  internetController.text);
            });
          },
          child: const Text('Verificar resultado'),
        ),
      ],
    );
  }

  FutureBuilder<AlgoritmoCollab> buildFutureBuilder() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<AlgoritmoCollab>(
      future: _futureAlgoritmoCollab,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.resultado ==
              "segundo nosso modelo sua escola foi classificada como APROVADA!") {
            return Column(
              children: <Widget>[
                const SizedBox(height: 70),
                Center(
                  child: Image.asset(
                    'lib/assets/images/approve.png',
                    width: size.width * .30,
                    fit: BoxFit.fill,
                  ),
                ),
                Text("segundo nosso modelo sua escola foi classificada como " +
                    snapshot.data!.resultado)
              ],
            );
          } else {
            return Column(
              children: <Widget>[
                const SizedBox(height: 70),
                Center(
                  child: Image.asset(
                    'lib/assets/images/denied.png',
                    width: size.width * .30,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "\nSegundo nosso modelo sua escola foi classificada como " +
                      snapshot.data!.resultado,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "\n\nisso significa que a entrada de dados fornecida pode ter sido reprovada corretamente em 73% dos casos")
              ],
            );
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
