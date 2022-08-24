import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {

   double startingWeight = 88;

   final List<String> dummy = ['Abba', 'Dnce', 'Little mix', 'Flo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Weight Tracker"),
        centerTitle: true,
        backgroundColor: peach,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 8.0)),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Starting Weight: ",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
                ),
                ),
            ),
            SizedBox(height: 10,),
              Card(
                elevation: 6.0,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Padding(padding: EdgeInsets.only(left: 15),
                        child: Text(
                          startingWeight.toString() + " kg",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       ),
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey
                            ))
                      ],
                    ),
                    SizedBox(height: 12.0,),
                  ]
                ),
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Recent Weight: ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              //Ignore the list
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Center(
                        child: Text(dummy[index])),
                    );
                    }, 
                  separatorBuilder: (BuildContext context, int index) => Divider(), 
                  itemCount: dummy.length),
              )
      ])    ),
      );
   
  }
}