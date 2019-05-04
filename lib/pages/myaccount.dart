import 'package:flutter/material.dart';
import 'package:train_ticket_exchange/pages/addnewticket.dart';
import 'package:train_ticket_exchange/pages/settings.dart';

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
            sellTicket("Sell Ticket", Icons.attach_money),
            settings("Settings", Icons.settings),
//            makeDashboardItem("Alphabet", Icons.alarm),
//            makeDashboardItem("Alphabet", Icons.alarm),
//            makeDashboardItem("Alphabet", Icons.alarm)
          ],

        ),
      )

    );
  }
  Card sellTicket(String title , IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/myaccount/sell.png'),
              fit:BoxFit.fitHeight
            ),
            border: Border.all(
              color: Colors.white70,
              width: 3.0,
            ),
          ),
          child: new InkWell(
            onTap: () =>
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => AddNewTicket())),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 70.0),
                Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
                SizedBox(height: 5.0),
                Center(
                    child: Icon(
                      icon,
                      size: 20.0,
                      color: Colors.white70,
                    )),
              ],
            ),
          ),
        ));
  }

  Card settings(String title , IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('images/myaccount/sell.png'),
                fit:BoxFit.fitHeight
            ),
            border: Border.all(
              color: Colors.white70,
              width: 3.0,
            ),
          ),
          child: new InkWell(
            onTap: () =>
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Settings())),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 70.0),
                Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
                SizedBox(height: 5.0),
                Center(
                    child: Icon(
                      icon,
                      size: 20.0,
                      color: Colors.white70,
                    )),
              ],
            ),
          ),
        ));
  }

}
