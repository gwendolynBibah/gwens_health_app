import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pedometer extends StatefulWidget {
  const Pedometer({Key? key}) : super(key: key);

  @override
  State<Pedometer> createState() => _PedometerState();
}

class _PedometerState extends State<Pedometer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: peach,
        title: Text("Steps Taken"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
              Padding(
                padding: EdgeInsets.only(top: 10.0)),
                Expanded(
                  child: CircularPercentIndicator(
                    // center: Text(
                    //   "Steps taken",
                    //   style: TextStyle(
                    //     fontSize: 25 ),
                    //   ),
                    radius: 120.0,
                    percent: .12,
                    animation: true,
                    animateFromLastPercent: true,
                    lineWidth: 15.0,
                    progressColor: orange,
                    footer: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        //Remove this and input the actual value"
                        "Steps",
                       // "Steps: $_stepCountValue",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          // color: 
                        ),
                      ),),
                       center:  Center(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 40,
                                            width: 25,
                                            padding: const EdgeInsets.only(left: 10.0, right: 1),
                                            child: const Icon(
                                              //Also remove this
                                              Icons.directions_walk_outlined,
                                              //FontAwesomeIcons.walking,
                                              size: 25.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text("Steps Taken")
          ]),
                    
                    )
        ),
        
        )
        ]
        )
        )
      );
    
  }
}