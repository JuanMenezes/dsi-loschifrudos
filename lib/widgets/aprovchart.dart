import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

class aprovchart extends StatefulWidget {
  @override
  _aprovchartState createState() => _aprovchartState();
}

class _aprovchartState extends State {
  late int touchedIndex;
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
      child: Row(
        children: <Widget>[
          const SizedBox(height: 18),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (PieTouchResponse) {
                      setState(() {
                        if (PieTouchResponse.touchInput is FlLongPressEnd ||
                            PieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = PieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingsections()),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Colors.green,
                text: 'Aprovados',
                isSquare: true,
              ),
              SizedBox(height: 4),
              Indicator(color: Colors.red, text: 'Reprovados', isSquare: true),
              SizedBox(height: 4),
              Indicator(
                  color: Colors.black54,
                  text: 'Não contabilizados',
                  isSquare: true),
              SizedBox(height: 4),
            ],
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingsections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: Colors.greenAccent,
              value: 90,
              title: '90%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: 7,
            title: '7%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow[400],
            value: 3,
            title: '3%',
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
