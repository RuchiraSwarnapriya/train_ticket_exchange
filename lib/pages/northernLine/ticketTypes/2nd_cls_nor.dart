import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class SecondClsNor extends StatefulWidget {
  @override
  _SecondClsNorState createState() => _SecondClsNorState();
}

class _SecondClsNorState extends State<SecondClsNor> {

  Future data;

  Future getTickets() async{
    QuerySnapshot qn = await Firestore.instance.collection("NorthernLineTicketDetails").document('2nd Class').collection('Tickets').getDocuments();

    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => TicketDetails(post: post,)));
  }
  @override

  void initState(){
    super.initState();

    data = getTickets();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
        body: Container(
          child: FutureBuilder(
              future: data,
              builder: (_, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index){
                        Widget column1 = Expanded(
                          child: Column(
                            // align the text to the left instead of centered
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(snapshot.data[index].data["startStation"], style: TextStyle(fontSize: 16),),
                              Text('to',  style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
                              Text(snapshot.data[index].data["endStation"], style: TextStyle(fontSize: 16),),

                            ],
                          ),
                        );
                        var dateTime = snapshot.data[index].data["dateTime"];

                        var date = new DateFormat("EEE, MMM d, yyyy").format(dateTime);

                        var time = new DateFormat("h:mm a").format(dateTime);

//                        var time = DateTime.parse(day);

                        Widget column2 = Expanded(
                          child: Column(
                            // align the text to the left instead of centered
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(date, style: TextStyle(fontSize: 12)),
                              Text(time, style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        );

                        return Card(
                            child: InkWell(
                              onTap: ()=> navigateToDetail(snapshot.data[index]),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child:Row(
                                    children: <Widget>[
                                      column1,
                                      column2,
                                    ],

                                  )
                              ),

                            )



                        );
                      });
                }
              }),
        )
    );
  }
}

class TicketDetails extends StatefulWidget {

  final DocumentSnapshot post;

  TicketDetails({this.post});

  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Ticket Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color:Colors.black),
      ),
      body: Container(
        child: Card(
          child: ListTile(
            title: Text(widget.post.data["startStation"]),
          ),
        ),

      ),
    );
  }
}
