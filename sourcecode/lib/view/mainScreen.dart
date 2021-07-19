import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  static const String idScreen  = "mainScreen";


  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
    );
  }
}
