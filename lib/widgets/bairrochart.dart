import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarChart.withSampleData() {
    return new HorizontalBarChart(_createSampleData(), animate: false);
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return Container(
        height: 350.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Aprovbairro2017')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var b1 = snapshot.data!.docs[0]['bairro'];
                var p1 = snapshot.data!.docs[0]['Aprovados'];

                return new charts.BarChart(
                  seriesList,
                  animate: animate,
                  vertical: false,
                );
              } else {
                return const Text('Loading...');
              }
            }));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<bestap, String>> _createSampleData() {
    final data = [
      new bestap('Torreao', 94.74),
      new bestap('Espinheiro', 93.37),
      new bestap('Alto sta Terezinha', 91.61),
      new bestap('Encruzilhada', 91.28),
      new bestap('Bomba do hemetério', 91.12)
    ];

    return [
      new charts.Series<bestap, String>(
        id: 'Aprovacao',
        domainFn: (bestap Aprovacao, _) => Aprovacao.tx,
        measureFn: (bestap Aprovacao, _) => Aprovacao.bairro,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class bestap {
  final bairro;
  final tx;

  bestap(this.bairro, this.tx);
}
