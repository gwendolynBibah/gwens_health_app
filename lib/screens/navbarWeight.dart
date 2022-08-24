import 'package:flutter/material.dart';
import 'package:health_app/colors.dart';
import 'package:health_app/screens/weighttracker.dart';
import 'home_screen.dart';
import 'bmi.dart';
import 'statistics.dart';

class weightNavbar extends StatefulWidget {
  const weightNavbar({Key? key}) : super(key: key);

  @override
  State<weightNavbar> createState() => _weightNavbarState();
}

class _weightNavbarState extends State<weightNavbar> {

  int selectedIndex = 0;

  final List<Widget> _destinations = <Widget>[
    bmi_page(),
    Tracker(),
    Statistics()
  ];

  void _onItemSelect(int index){
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.line_weight), label: "BMI"),
          BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label: "Tracker"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          
        ],
        currentIndex: selectedIndex,
        onTap: _onItemSelect,
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: peach,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        )
      ),
    );
  }
}