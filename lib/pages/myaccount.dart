import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:train_ticket_exchange/pages/addnewticket.dart';
import 'package:train_ticket_exchange/pages/settings.dart';
import 'package:train_ticket_exchange/pages/requestTicket.dart';

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

      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        children: <Widget>[
          sellTickets(Icons.attach_money,"Sell Ticket"),
          requestTickets(Icons.train,"Request Ticket"),


        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
        ],

      ),


    );
  }

//  Material settings(IconData icon,String heading){
//    return Material(
//      color: Colors.white,
//      elevation: 14.0,
//      shadowColor: Colors.grey,
//      borderRadius: BorderRadius.circular(15.0),
//      child: Center(
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: new InkWell(
//            onTap: () =>
//                Navigator.push(context, new MaterialPageRoute(
//                    builder: (context) => Settings())),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(heading,
//                        style: TextStyle(
//                          fontSize: 20.0,
//                        ),
//                      ),
//                    ),
//
//                    Material(
////                      color: Colors.black,
////                      borderRadius: BorderRadius.circular(10.0),
//                      child: Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: Icon(
//                          icon,
//                          color: Colors.black,
//                          size: 30.0,
//                        ),
//
//                      ),
//                    ),
//                  ],
//                )
//              ],
//            ),
//
//          )
//
//        ),
//      ),
//    );
//  }

  Material sellTickets(IconData icon,String heading){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(15.0),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new InkWell(
              onTap: () =>
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => AddNewTicket())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                      Material(
//                      color: Colors.black,
//                      borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            icon,
                            color: Colors.black,
                            size: 30.0,
                          ),

                        ),
                      ),
                    ],
                  )
                ],
              ),

            )

        ),
      ),
    );
  }

  Material requestTickets(IconData icon,String heading){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(15.0),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new InkWell(
              onTap: () =>
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => RequestTicket())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                      Material(
//                      color: Colors.black,
//                      borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            icon,
                            color: Colors.black,
                            size: 30.0,
                          ),

                        ),
                      ),
                    ],
                  )
                ],
              ),

            )

        ),
      ),
    );
  }



}
