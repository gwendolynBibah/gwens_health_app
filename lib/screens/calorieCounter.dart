// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: peach,
        title: Text("Calorie Counter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                child: CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 15.0,
                  progressColor: peach,
                  animateFromLastPercent: true,
                  animation: true,
                  percent: .43,
                  center: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fastfood,
                          color: Colors.grey,
                          ),
                        SizedBox(width: 10,),
                        Text("Calories Consumed")
                      ]),
                  ),
                  ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  nutrientPercentage(
                    percentage: .26,
                    nutrient: "Fat",
                  ),
                //  SizedBox(height: 10),
                  nutrientPercentage(
                    nutrient: "carbs", 
                    percentage: .24),
                    // SizedBox(height: 10),
                  nutrientPercentage(
                    nutrient: "Protein", 
                    percentage: .76)
                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}

class nutrientPercentage extends StatelessWidget {
  final String nutrient;
  final double percentage;

  const nutrientPercentage({
    Key? key,
    required this.nutrient,
    required this.percentage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red
        )
      ),
      height: 50,
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              nutrient.toUpperCase(),
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
                fontWeight: FontWeight.w600
          
              ),
              ),
          ),
          SizedBox(height: 5.0),
          LinearPercentIndicator(
            progressColor: peach,
            animation: true,
            animationDuration: 2000,
            animateFromLastPercent: true,
            barRadius: Radius.circular(80),
            percent: percentage,
            lineHeight: 8,
            width: MediaQuery.of(context).size.width *.25,
            
          ),
        ],
      ),
    );
  }
}