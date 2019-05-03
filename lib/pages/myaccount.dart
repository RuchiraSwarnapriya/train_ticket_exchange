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
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 3.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Ordbog"),
//            makeDashboardItem("Alphabet", Icons.monetization_on),
//            makeDashboardItem("Alphabet", Icons.alarm),
//            makeDashboardItem("Alphabet", Icons.alarm),
//            makeDashboardItem("Alphabet", Icons.alarm),
//            makeDashboardItem("Alphabet", Icons.alarm)
          ],

        ),
      )

    );
  }
  Card makeDashboardItem(String title, ) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
//                Center(
//                    child: Icon(
//                      icon,
//                      size: 40.0,
//                      color: Colors.black,
//                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

}
