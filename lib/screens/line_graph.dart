

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_app/colors.dart';

class Line_Graph extends StatefulWidget {
  const Line_Graph({Key? key}) : super(key: key);

  @override
  State<Line_Graph> createState() => _LineGraphState();
}

class _LineGraphState extends State<Line_Graph> {

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: peach
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12
              ),
              child: LineChart(
                mainData(),
                swapAnimationCurve: Curves.easeInOutCubic,
                swapAnimationDuration: Duration(milliseconds: 1000),
              ),
              ),
           ),
          ),
          SizedBox(
            height: 34,
            width: 60,
            child: Text(
              "avg",
              style: TextStyle(
                fontSize: 12,
                //color
              ),
            ),
            
            ),
      ],
    );
  }
}

LineChartData mainData() {
  List<FlSpot> _monthlySpots = [
  FlSpot(0, 110.0),
  FlSpot(1, 110.0),
  FlSpot(2, 130.0),
  FlSpot(3, 100.0),
  FlSpot(4, 130.0),
  FlSpot(5, 160.0)
  ];

  return LineChartData(
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: peach,
        width: 2
      )
      ),
      minX: 0,
      minY: 0,
      maxX: 10,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: _monthlySpots,
          isCurved: true,
          barWidth: 2
        )
      ],
      gridData: FlGridData(
        show: true
      ),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)),
         topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)),
         bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            //getTitlesWidget: ()
          ),
         ),
         leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            //getTitlesWidget: 
          ),
      )
    
  ));
}