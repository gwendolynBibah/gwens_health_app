// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';

class bmi_page extends StatefulWidget {
  const bmi_page({Key? key}) : super(key: key);

  @override
  State<bmi_page> createState() => _bmi_pageState();
}

class _bmi_pageState extends State<bmi_page> {
  int current_index = 0;

//the controllers for the textfields
TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("BMI Calculator", ),
        backgroundColor: peach,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(13.0),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     radioButton("value", buttonColor, index)
                //   ],)
                Padding(
                  padding: EdgeInsets.only(top: 15.0)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Your Height in Cm:",
                 style: TextStyle(
                  fontSize: 20.0,
                 ),
                ),
                  ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Height In Cm",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none
                      )
                   ),
                ),
                SizedBox(height:25.0),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Your Weight in Kg:",
                 style: TextStyle(
                  fontSize: 20.0,
                 ),
                ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Weight In Kg",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none
                      )
                   ),
                ),
                SizedBox(height: 25.0,),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    child: Text("Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                    ),
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      backgroundColor: peach, 
                    ) 
                    ),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      width: double.infinity,
                      child: Text("Your BMI is :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                       ),
                      ),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      height: 60.0,
                      color: peach,
                      width: double.infinity,
                      child: Text(" ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                       ),
                      ),
                    )
                ])

                
              
          )
          )
          );
  }


  void changeIndex(int index){
    setState(() {
      current_index = index;
    });
  }


  Widget radioButton( 
    String value, 
    MaterialStateColor buttonColor, 
    int index){
    return Expanded(
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: TextButton(
          //button color changes when selected
          //buttonColor: current_index == index ? Colors.grey[300],
          //current_index == index ? buttonColor : Colors.grey[300]
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: current_index == index ? Colors.white : buttonColor,
            ),
            ),
          style: ButtonStyle(
          backgroundColor: current_index == index ? buttonColor : MaterialStateProperty.all<Color>(Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)))
          ),
        ),));
  }

} 