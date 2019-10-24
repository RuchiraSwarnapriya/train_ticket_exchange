import 'package:flutter/material.dart';
import 'package:train_ticket_exchange/components/costalLineCato.dart';

class CostalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        title: Text('Costal Line',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          new Padding(padding: const EdgeInsets.all(10.0),
          child: new Text("Ticket Categories", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),),
          CostalLineCatogries()
        ],
      ),
    );
  }
}