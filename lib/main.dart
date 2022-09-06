import 'package:flutter/material.dart';
import 'package:health_app/screens/login.dart';
import 'package:health_app/screens/navbar.dart';
import 'package:health_app/screens/onboarding.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        //fontFamily: "Poppins"
      ),
      home: Onboarding_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
