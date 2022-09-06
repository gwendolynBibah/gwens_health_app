import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'calorieCounter.dart';
import 'mealplanner.dart';
import 'meal_planner.dart';

class NutritionNav extends StatefulWidget {
  const NutritionNav({Key? key}) : super(key: key);

  @override
  State<NutritionNav> createState() => _NutritionNavState();
}

class _NutritionNavState extends State<NutritionNav> {

  int selectedIndex = 0;

  final List<Widget> _destinations = <Widget>[
      Counter(),
      MealPlanner()
  ];

  void _onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _destinations.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Counter"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: "Planner"),
            //BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: selectedIndex,
        onTap: _onItemSelect,
        ),
    );
  }
}