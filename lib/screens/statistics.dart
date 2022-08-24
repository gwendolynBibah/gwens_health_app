import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:health_app/screens/line_graph.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'home_screen.dart';
import 'navbarWeight.dart';
import 'line_graph.dart';


class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _weightTrackerState();
}

class _weightTrackerState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: peach,
          title: Text("Statistics"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Goal Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                      
                      ),
                  ),
                  OutlinedButton(
                    onPressed: () {}, 
                    child: Text("Edit",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ))
                ],
              ),
              SizedBox(height: 25.0,),
              Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16
                      ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: CircularPercentIndicator(
                              radius: 120,
                              lineWidth: 13,
                              animation: true,
                              animationDuration: 2000,
                              startAngle: 270,
                              arcType: ArcType.HALF,
                              percent: 0.6,
                              arcBackgroundColor: Colors.grey[300],
                              progressColor: peach,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Column(
                                children: [
                                  SizedBox(height: 60,),
                                  Text("now",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600
                                  ),
                                  ),
                                  Text(
                                    "80 kg",
                                    style: TextStyle(
                                      color: peach,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25
                                    ),
                                    )
                                ],
                              ),
                              )
                              ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "100kg",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text(
                        'Dropped ~ 4 kg',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '72',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        )
                      ],
                    ),
                    ),
              ),
               SizedBox(height: 25.0,),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Statistics",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                             ),
                          ),
                          OutlinedButton(
                            onPressed: () {}, 
                            child: Text(
                              "Week",
                              style: TextStyle(
                                color: Colors.black
                              ),
                              )
                              )
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Line_Graph()
              ]),
                )
              ]
            ),
          ),
        ),
    );
  }
}