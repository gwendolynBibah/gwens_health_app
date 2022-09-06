import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}



class _PlannerState extends State<Planner> {
 //fpr adding food in the function
  TextEditingController foodController = TextEditingController();
  
  late String addFood;

  // List<Food> _food ={
  //   Food break(),
  // }

  //breakfast list
  List<String> breakfastItem = [];

  //lunch list
  List<String> lunchItem = [];

  //dinner list
  List<String> dinnerItem = [];

  //snack 1
 List<String> snack1Item = [];
 
  //snack 2
  List<String> snack2Item = [];

   //function for adding items to the breakfast list
    void addBreakfastItem() {
    //should take the text in the box and display it in the card
                              setState((){
                              breakfastItem.add(foodController.text);
                              foodController.clear();  
                              Navigator.pop(context);                          
                              //txtValidate = true;
                              });
    }

     //function for adding items to the breakfast list
    void addSnack1Item() {
    //should take the text in the box and display it in the card
                              setState((){
                              snack1Item.add(foodController.text);
                              foodController.clear();  
                              Navigator.pop(context);                          
                              //txtValidate = true;
                              });
    }

void taskInputDialog(TextEditingController foodController, VoidCallback buttonFunct) {
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
                  "Add Meal",
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: foodController,
                    autofocus: true,
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
          title: Text("Meal Tracker", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                
                mealName(
                  foodController: foodController, 
                  mealPeriod: "Breakfast",
                  iconAdd: (() =>taskInputDialog( foodController,addBreakfastItem)),
                  ), 
                // Divider(
                //   color: Colors.grey,
                // ),
                mealPlan(foodList: breakfastItem),
                Divider(
                  height: 5,
                  color: Colors.black,
                ),
                mealName(
                mealPeriod: "Snack", 
                iconAdd: (()=>taskInputDialog(foodController, addSnack1Item)), 
                foodController: foodController)
              ],
            ),
          ),
        ));
  }
}

//the name of each meal period
class mealName extends StatelessWidget {
  final String mealPeriod;
  final VoidCallback iconAdd;

  const mealName({
    Key? key,
    required this.mealPeriod,
    required this.iconAdd,
    required this.foodController,
  }) : super(key: key);

  final TextEditingController foodController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
           mealPeriod + ":",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
          ),
        ),
        IconButton(
          onPressed: iconAdd,
          icon: Icon(Icons.add),
          color: Colors.grey,
          iconSize: 30,
        )
    ],
    );
  }
}

//a list view for a list of food eaten at a particular meal period
class mealPlan extends StatefulWidget {

 //final List foodList;

  const mealPlan({
    Key? key,
   // required this.foodList,
    required this.foodList,
  }) : super(key: key);

  final List<String> foodList;

  @override
  State<mealPlan> createState() => _mealPlanState();
}

class _mealPlanState extends State<mealPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child:  Column(
        children: [
          ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         "\u2022 " + widget.foodList[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15
                          ),
                        ),
                         IconButton(
                                      onPressed: (){
                                        setState(() {
                                          widget.foodList.removeAt(index);
                                        });
                                      },
                                     icon: Icon(Icons.delete),
                                      color: Colors.grey,
                                      iconSize: 20,
                                      )
                      ],
                    ),
                  );
              },
              // separatorBuilder: (BuildContext context, int index) =>
                  // Divider(
                  //   color: Colors.grey,
                  // ),
              itemCount: widget.foodList.length),
              Divider(),
        ],
      ),
    );
  }
}
