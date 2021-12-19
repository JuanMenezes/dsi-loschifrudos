import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class gridbairro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.deepPurple,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Aprovgeral2017')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var totalbai = snapshot.data!.docs[0]['total'];
              var maiorap = snapshot.data!.docs[0]['Maiorap'];
              var maiorrep = snapshot.data!.docs[0]['mairorep'];
              var baiap = snapshot.data!.docs[0]['bairap'];
              var bairep = snapshot.data!.docs[0]['bairrep'];
              return Column(children: <Widget>[
                Flexible(
                    child: Row(
                  children: <Widget>[
                    _buildcard('Nº Total de bairros', totalbai.toString(),
                        Colors.lightBlue)
                  ],
                )),
                Flexible(
                    child: Row(
                  children: <Widget>[
                    _buildcard(
                        'Maior taxa de aprovação',
                        baiap.toString() + ' - ' + maiorap.toString() + '%',
                        Colors.green),
                    _buildcard(
                        "Maior taxa de reprovação",
                        bairep.toString() + ' - ' + maiorrep.toString() + '%',
                        Colors.red),
                  ],
                ))
              ]);
            } else {
              return const Text('Loading...');
            }
          }),
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
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(count,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600))
          ]),
    ));
  }
}
