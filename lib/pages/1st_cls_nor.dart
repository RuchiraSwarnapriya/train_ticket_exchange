import 'package:flutter/material.dart';

class FirstClsNor extends StatefulWidget {
  @override
  _FirstClsNorState createState() => _FirstClsNorState();
}

class _FirstClsNorState extends State<FirstClsNor> {
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
