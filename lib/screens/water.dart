import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class water_page extends StatefulWidget {
  const water_page({Key? key}) : super(key: key);

  @override
  State<water_page> createState() => _water_pageState();
}

class _water_pageState extends State<water_page> {
  int water_drank = 0;
  var inputNumber;
 
 //input controller
 TextEditingController inputController = TextEditingController();

 //for taking user input
 void numberInput() {
  showDialog(
    context: context,
   builder: (context) {
    return StatefulBuilder(
      builder: (context,  setState) {
        return AlertDialog(
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(
            "Input Custom Amount"
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller:  inputController,
              autofocus: true
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Should take input and add it to total
                        inputNumber = inputController.text;
        
        
                        //Validation
                      },
                      child: Text("Add Amount"),
                    )
                    
                    )
              ],
            )
          ],
        ),
         );
      }      
       );
   });
 }

  void waterCounter(wa) {
    setState(() {
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Current Hydration"),
        centerTitle: true,
        backgroundColor: peach,
      ),
        body: Container(
          width: double.infinity,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Expanded(
            child: CircularPercentIndicator(
              radius: 120.0,
              percent: .23,
              animation: true,
              animateFromLastPercent: true,
              lineWidth: 12.0,
              progressColor: peach,
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
                                              Icons.water_drop,
                                              //FontAwesomeIcons.walking,
                                              size: 25.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text("Water Drank")]))
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // decoration: BoxDecoration(
                  // color: Colors.teal[900],
                  // borderRadius: BorderRadius.only(
                  //     topRight: Radius.circular(30.0),
                  //     topLeft: Radius.circular(30.0))),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.0
                          ),
                          child: Column(
                                              children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              waterButtons(
                                buttonLitre: "100ml",
                                 buttonColor: darkPurple,
                                 waterValue: 100,
                                ),
                              waterButtons(
                                buttonLitre: "250ml",
                                buttonColor: orange,
                                waterValue: 250,
                                )
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              waterButtons(
                                buttonLitre: "300ml",
                                buttonColor: darkPink,
                                waterValue: 300,
                                ),
                              waterButtons(
                                buttonLitre: "500ml",
                                buttonColor: yellow,
                                waterValue: 500,
                                )
                            ],
                          )
                                              ],
                                            ),
                        ))
                  ],
                ),
              ),
            ),
          )
                ],
            ),
        ),
    //this takes input from the the user
    floatingActionButton: FloatingActionButton(
      onPressed: numberInput,
      backgroundColor: peach,
      child: Center(
        child: Icon(
          Icons.add,
          size: 38.0,
          )
      ),
      elevation: 12,
      ),
    
    );
  }
}

class waterButtons extends StatelessWidget {
  final String buttonLitre;
  final Color buttonColor;
  final int waterValue;

  const waterButtons({
    Key? key, 
    required this.buttonLitre,
    required this.buttonColor,
    required this.waterValue
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
         color: buttonColor,
          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.white,
          //       spreadRadius: 1,
          //       blurRadius: 8,
          //       offset: Offset(4, 4)),
          //   BoxShadow(
          //       color: Colors.purple,
          //       spreadRadius: 1,
          //       blurRadius: 8,
          //       offset: Offset(-4, -4))
          // ]
          ),
      child: Center(
        child: Text(
          buttonLitre,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }
}
