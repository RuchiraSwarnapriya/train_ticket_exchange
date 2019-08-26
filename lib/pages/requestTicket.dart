import 'package:flutter/material.dart';

class RequestTicket extends StatefulWidget {
  @override
  _RequestTicketState createState() => _RequestTicketState();
}

class _RequestTicketState extends State<RequestTicket> {
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
