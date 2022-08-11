import 'package:flutter/material.dart';

class bmi_page extends StatefulWidget {
  const bmi_page({Key? key}) : super(key: key);

  @override
  State<bmi_page> createState() => _bmi_pageState();
}

class _bmi_pageState extends State<bmi_page> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", ),
        elevation: 0.0,
        backgroundColor: Colors.teal[900],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [],
            ),
            ),
        ),
    );
  }
}