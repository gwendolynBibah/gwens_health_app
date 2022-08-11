import 'package:flutter/material.dart';


class sleep_page extends StatefulWidget {
  const sleep_page({Key? key}) : super(key: key);

  @override
  State<sleep_page> createState() => _sleep_pageState();
}

class _sleep_pageState extends State<sleep_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sleep")),
    );
  }
}