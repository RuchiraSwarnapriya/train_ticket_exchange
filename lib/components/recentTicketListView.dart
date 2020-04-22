import 'package:flutter/material.dart';

class RecentTickets extends StatefulWidget {
  @override
  _RecentTicketsState createState() => _RecentTicketsState();
}

class _RecentTicketsState extends State<RecentTickets> {
  var ticketList = [
    {
      "start_station": "Kandy",
      "end_station": "Colombo",
      "date_time": "2019/04/21 6.15AM",
      "image": "images/ticketcato/1stclassobservation.png"
    },
    {
      "start_station": "Colombo",
      "end_station": "Kandy",
      "date_time": "2019/04/21 3.35PM",
      "image": "images/ticketcato/1stclassobservation.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: ticketList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return TicketDetails(
            startStation: ticketList[index]['start_station'],
            endStation: ticketList[index]['end_station'],
            startDateTime: ticketList[index]['date_time'],
            ticketImage: ticketList[index]['image'],
          );
        });
  }
}

class TicketDetails extends StatelessWidget {
  final startStation;
  final endStation;
  final startDateTime;
  final ticketImage;

  TicketDetails(
      {this.startStation,
      this.endStation,
      this.startDateTime,
      this.ticketImage});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: startStation,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.black.withOpacity(0.75),
                    child: ListTile(
                      leading: Text(
                        startStation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: Image.asset(ticketImage, fit: BoxFit.fitHeight)),
            ),
          )),
    );
  }
}
