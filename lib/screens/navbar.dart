import 'package:flutter/material.dart';
import 'package:health_app/main.dart';
import 'show_profile.dart';
import 'home_screen.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {

  int selectedIndex = 0;

  final List<Widget> _navDestinations = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const show_proile()
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _navDestinations.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Overview"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        ),
    );
  }
}