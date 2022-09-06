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

  //Text Editing controller for the pop up box
  final calorieController = TextEditingController();

  //for the add weight button
  void taskInputDialog(TextEditingController funcController, VoidCallback buttonFunct) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Center(
                child: Text(
                  "Add Weight",
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: funcController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    // decoration: InputDecoration(
                    //   errorText: txtValidate ? null : errTxt
                    // ),                   
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: ElevatedButton(
                            onPressed: buttonFunct,
                            child: Text("Add")),
                      )
                    ],
                  )
                ],
              ));
            });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: peach,
        title: Text("Calorie Counter"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => taskInputDialog(calorieController, (){} )),
        backgroundColor: peach,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35
          ),
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
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LinearPercentIndicator(
                progressColor: peach,
                animation: true,
                animationDuration: 2000,
                animateFromLastPercent: true,
                barRadius: Radius.circular(80),
                percent: percentage,
                lineHeight: 8,
                width: MediaQuery.of(context).size.width *.75,
              ),
              Icon(
                Icons.add,
                color: Colors.grey,
                size: 25,
                )
            ],
          ),
        ],
      ),
    );
  }
}