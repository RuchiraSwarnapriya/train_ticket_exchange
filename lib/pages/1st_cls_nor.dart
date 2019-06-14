import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirstClsNor extends StatefulWidget {
  @override
  _FirstClsNorState createState() => _FirstClsNorState();
}

class _FirstClsNorState extends State<FirstClsNor> {
  Future getTickets() async{
    QuerySnapshot qn = await Firestore.instance.collection("TicketDetails").document('1st Class Normal').collection('Tickets').getDocuments();

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
