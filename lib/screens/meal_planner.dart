import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:health_app/food.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({Key? key}) : super(key: key);

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  TextEditingController foodController = TextEditingController();

  late String addFood;

  // List<Food> _food ={}

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

  void addBreakfastItem() {
    //should take the text in the box and display it in the card
    setState(() {
      breakfastItem.add(foodController.text);
      foodController.clear();
      Navigator.pop(context);
      //txtValidate = true;
    });
  }

  //function for adding items to the breakfast list
  void addSnack1Item() {
    //should take the text in the box and display it in the card
    setState(() {
      snack1Item.add(foodController.text);
      foodController.clear();
      Navigator.pop(context);
      //txtValidate = true;
    });
  }

  //function for adding items to the breakfast list
  void addSnack2Item() {
    //should take the text in the box and display it in the card
    setState(() {
      snack2Item.add(foodController.text);
      foodController.clear();
      Navigator.pop(context);
      //txtValidate = true;
    });
  }

  //function for adding items to the breakfast list
  void addLunchItem() {
    //should take the text in the box and display it in the card
    setState(() {
      lunchItem.add(foodController.text);
      foodController.clear();
      Navigator.pop(context);
      //txtValidate = true;
    });
  }

  //function for adding items to the breakfast list
  void addDinnerItem() {
    //should take the text in the box and display it in the card
    setState(() {
      dinnerItem.add(foodController.text);
      foodController.clear();
      Navigator.pop(context);
      //txtValidate = true;
    });
  }

  void taskInputDialog(
      TextEditingController foodController, VoidCallback buttonFunct) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
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
                              onPressed: buttonFunct, child: Text("Add")),
                        )
                      ],
                    )
                  ],
                ));
          });
        });
  }

  late final List<String> foodList = [];

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
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Column(
          children: [
              Card(
                //color: Colors.blue,
                child: Column(children: [
                  mealName(
                      mealPeriod: 'BreakFast',
                      iconFunction: () =>
                          taskInputDialog(foodController, addBreakfastItem),
                      foodController: foodController),
                  listViewFoodItem(foodList: breakfastItem),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                
               // color: Colors.red,
                child: Column(children: [
                  mealName(
                      mealPeriod: "Snack",
                      iconFunction: () =>
                          taskInputDialog(foodController, addSnack1Item),
                      foodController: foodController),
                  listViewFoodItem(foodList: snack1Item),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              Card(
               // color: Colors.pink,
                child: Column(children: [
                  mealName(
                      mealPeriod: "Lunch",
                      iconFunction: () =>
                          taskInputDialog(foodController, addLunchItem),
                      foodController: foodController),
                  listViewFoodItem(foodList: lunchItem),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
               // color: Colors.indigo,
                child: Column(children: [
                  mealName(
                      mealPeriod: "Snack",
                      iconFunction: () =>
                          taskInputDialog(foodController, addSnack2Item),
                      foodController: foodController),
                  listViewFoodItem(foodList: snack2Item),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                child: Column(children: [
                  mealName(
                      mealPeriod: "Dinner",
                      iconFunction: () =>
                          taskInputDialog(foodController, addDinnerItem),
                      foodController: foodController),
                  listViewFoodItem(foodList: dinnerItem)
                ]),
              ),
              
          ],
        ),
            )));
  }
}

//Widget for list view food items
class listViewFoodItem extends StatefulWidget {
  const listViewFoodItem({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  final List<String> foodList;

  @override
  State<listViewFoodItem> createState() => _listViewFoodItemState();
}

class _listViewFoodItemState extends State<listViewFoodItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 6.0,
              //padding: EdgeInsets.all(3.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\u2022 " + widget.foodList[index],
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.foodList.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                         // color: Colors.deepPurple,
                          iconSize: 20,
                        )
                      ],
                    ),
                    // Divider(
                    //   color: Colors.black,
                    // ),
                  ],
                ),
              ),
            );
          },
          // separatorBuilder: (BuildContext context, int index) =>
      
          itemCount: widget.foodList.length),
    );
  }
}

//the name of each meal period
class mealName extends StatelessWidget {
  final String mealPeriod;
  final VoidCallback iconFunction;

  const mealName({
    Key? key,
    required this.mealPeriod,
    required this.iconFunction,
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
          onPressed: iconFunction,
          icon: Icon(Icons.add),
          color: Colors.grey,
          iconSize: 30,
        )
      ],
    );
  }
}


//what i need to do
//make sure the height of the widget matches the height of the child listview