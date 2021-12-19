import 'package:flutter/material.dart';

class statsgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.deepPurple,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: <Widget>[
              _buildcard('Taxa de Aprovação', '90%', Colors.green),
              _buildcard("Taxa de Reprovação", '9%', Colors.red)
            ],
          )),
          Flexible(
              child: Row(
            children: <Widget>[
              _buildcard('Total de alunos', '5000', Colors.orange),
              _buildcard("Total de Escolas", '300', Colors.lightBlue),
            ],
          ))
        ],
      ),
    );
  }

  Expanded _buildcard(String title, String count, MaterialColor color) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(count,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600))
          ]),
    ));
  }
}
