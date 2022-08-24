import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {

  List<String> listItem = [];
  Widget listItemDecoration(listItem) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            " ",
            style: TextStyle(
              fontSize: 18
            ),
          ),
          onTap: () {},
        ),
      ),
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: peach,
        title: Text(
          "Meal Tracker",
        style: TextStyle(
          color: Colors.white
         )
        ),
        centerTitle: true,
      ),
      body:Column(
        children: [
          //Padding(padding: EdgeInsets.all(5)),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Breakfast",
              style: TextStyle(
                fontSize: 20.0 ,
                fontWeight: FontWeight.w400
                ),
              ),
          ),
            Divider(
              height: 15.0,
              thickness: 5,
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(listItem[index]),
                    );
                  }, 
                  separatorBuilder: (BuildContext context, int index) => Divider(), 
                  itemCount: listItem.length),
              ),
            ),
            Divider(
              height: 5,
              color: Colors.black,
            ),
            
        ],
      )
    );
  }
}
