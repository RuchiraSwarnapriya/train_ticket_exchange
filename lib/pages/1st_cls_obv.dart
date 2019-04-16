import 'package:flutter/material.dart';

class FirstClsObv extends StatefulWidget {
  @override
  _FirstClsObvState createState() => _FirstClsObvState();
}

class _FirstClsObvState extends State<FirstClsObv> {
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
