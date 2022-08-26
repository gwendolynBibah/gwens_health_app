import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'navbarWeight.dart';
import 'package:intl/intl.dart';

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {

  //for the time
  //DateTime currentTime = DateTime.parse(snapshot.data[])
  String currentTime = DateFormat("hh:mm:ss a").format(DateTime.now());

  //for the date
  String currentDate = DateFormat("EEE, dd, MMM, yyyy").format(DateTime.now());

  //controller for adding weight
  final weightController = TextEditingController();
  final startingWeightController = TextEditingController();

  //starting weight
   String startingWeight = "0.0";

   //final List<String> dummy = ['Abba', 'Dnce', 'Little mix', 'Flo'];
   //final List<double> listItem = [];

    //for task input
    late String addWeight;
    final List<String> listItem = [];

    //function for adding items to a list
    void addListItem() {
    //should take the text in the box and display it in the card
                              setState((){
                              listItem.add(weightController.text);
                              weightController.clear();  
                              Navigator.pop(context);                          
                              //txtValidate = true;
                              });
    }

    //for changing the starting weight
    void editStartingWeight(){
      setState(() {
        startingWeight = startingWeightController.text;
        startingWeightController.clear();
        Navigator.pop(context);
      });
    }
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
                             
                              // //to validate
                              // if(weightController.text.isEmpty){
                              //   setState((){
                              //     errTxt = "Can't Add Empty Space";
                              //     txtValidate = false;
                              //   });
                              // } else if (weightController.text.length > 120){
                              //   setState(() {
                              //     errTxt = "Too Many Characters";
                              //     txtValidate = false;
                              //   },);
                              // }
                              
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Weight Tracker"),
        centerTitle: true,
        backgroundColor: peach,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() =>  taskInputDialog(weightController, addListItem)),
        backgroundColor: peach,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        )
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
                        child: Expanded(
                          child: Text(
                            startingWeight + " kg",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                       ),
                        IconButton(
                          onPressed: ()=> taskInputDialog(startingWeightController, editStartingWeight), 
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
              
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: [ 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                  listItem[index]+ " kg",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        listItem.removeAt(index);
                                      });
                                    },
                                   icon: Icon(Icons.delete),
                                    color: Colors.grey,
                                    )
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Text(
                                    currentDate,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    currentTime,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              )
                              ]),
                              
                        ),
                      ),
                    );
                    }, 
                  separatorBuilder: (BuildContext context, int index) => Divider(), 
                  itemCount: listItem.length),
              )
      ])    ),
      );
   
  }
}