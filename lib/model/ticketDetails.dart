import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketDetails extends StatefulWidget {
  
  final DocumentSnapshot post;
  TicketDetails({this.post});
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    var startStation = widget.post.data["startStation"];
    var endStation = widget.post.data["endStation"];
    var dateTime = widget.post.data["dateTime"];
    var date = new DateFormat("EEE, MMM d, yyyy").format(dateTime);
    var time = new DateFormat("h:mm a").format(dateTime);
    var price = widget.post.data["price"];
    var contactNo = widget.post.data["contactNo"];

    return Scaffold(
      appBar: new AppBar(
        title: Text('Ticket Details',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(("Start Station :") + startStation),
            Text("End Station:" + endStation),
            Text("Journey Start Date" + date),
            Text("Journey Start Time" + time),
            Text("Ticket Price:" + price),
            Text("Contact Number:" + contactNo),
          ],
        ),
      ),
    );
  }
}



// class TicketDetails extends StatefulWidget {
  
//   final DocumentSnapshot post;
//   TicketDetails({this.post});
//   @override
//   _TicketDetailsState createState() => _TicketDetailsState();
// }

// class _TicketDetailsState extends State<TicketDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text('Ticket Details',
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black)),
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         iconTheme: new IconThemeData(color: Colors.black),
//       ),
//       body: Container(
//         child: Card(
//           child: ListTile(
//             title: Text(widget.post.data["startStation"]),
//           ),
//         ),
//       ),
//     );
//   }
// }
