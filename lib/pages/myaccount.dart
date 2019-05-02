import 'package:flutter/material.dart';
import 'package:train_ticket_exchange/pages/addnewticket.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/myaccount/sell.png')
            ),
          ),
          child: FlatButton(
            padding: EdgeInsets.all(0.0),
              onPressed: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> AddNewTicket())),
              child: null
          ),
        ),
      ),

    );
  }
}
