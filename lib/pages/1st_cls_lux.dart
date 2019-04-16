import 'package:flutter/material.dart';

class FirstClsLux extends StatefulWidget {
  @override
  _FirstClsLuxState createState() => _FirstClsLuxState();
}

class _FirstClsLuxState extends State<FirstClsLux> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
    );
  }
}
