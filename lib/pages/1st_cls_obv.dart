import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirstClsObv extends StatefulWidget {
  @override
  _FirstClsObvState createState() => _FirstClsObvState();
}

class _FirstClsObvState extends State<FirstClsObv> {
  Future getTickets() async{
    QuerySnapshot qn = await Firestore.instance.collection("TicketDetails").document('1st Class OBV').collection('Tickets').getDocuments();

    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
        body: Container(
          child: FutureBuilder(
              future: getTickets(),
              builder: (_, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: Text("Loading ..."),
                  );
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index){
                        return ListTile(
                          title: Text(snapshot.data[index].data["startStation"]),
                        );
                      });
                }
              }),
        )
    );
  }
}
