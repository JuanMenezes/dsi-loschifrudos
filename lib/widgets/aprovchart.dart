import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets.dart';

class aprovchart extends StatefulWidget {
  @override
  _aprovchartState createState() => _aprovchartState();
}

class _aprovchartState extends State {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
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
                .collection('Aprovgeral2017')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var porcaprov = snapshot.data!.docs[2]['Aprovados'];
                var porcrep = snapshot.data!.docs[2]['Reprovados'];
                var porcout = snapshot.data!.docs[2]['Outros'];
                return Column(children: <Widget>[
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Indicator(
                        color: const Color(0xff13d38e),
                        text: 'Aprovados',
                        isSquare: false,
                        size: touchedIndex == 2 ? 18 : 16,
                        textColor:
                            touchedIndex == 2 ? Colors.black : Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                          color: Colors.redAccent,
                          text: 'Reprovados',
                          isSquare: false,
                          size: touchedIndex == 0 ? 18 : 16,
                          textColor:
                              touchedIndex == 0 ? Colors.black : Colors.grey),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: const Color(0xfff8b250),
                        text: 'Não contabilizado',
                        isSquare: false,
                        size: touchedIndex == 1 ? 18 : 16,
                        textColor:
                            touchedIndex == 1 ? Colors.black : Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                            pieTouchData: PieTouchData(touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            }),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: showingSections(
                                MediaQuery.of(context).size.width,
                                porcaprov,
                                porcrep,
                                porcout)),
                      ),
                    ),
                  ),
                ]);
              } else {
                return const Text('Loading...');
              }
            }));
  }

  List<PieChartSectionData> showingSections(
      double screenWidth, var ap, var rep, var out) {
    double radius = screenWidth / 3.5;
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final Opacity = isTouched ? 1.0 : 0.6;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.redAccent.withOpacity(Opacity),
            value: rep,
            title: rep.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250).withOpacity(Opacity),
            value: double.parse(out.toString()),
            title: out.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e).withOpacity(Opacity),
            value: double.parse(ap.toString()),
            title: ap.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
