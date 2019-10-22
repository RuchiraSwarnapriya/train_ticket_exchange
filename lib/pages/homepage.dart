import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:train_ticket_exchange/pages/mytickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:train_ticket_exchange/pages/signInpage.dart';
import 'package:train_ticket_exchange/components/horizontallistview.dart';
import 'package:train_ticket_exchange/components/recentTicketListView.dart';
import 'package:train_ticket_exchange/pages/2nd_cls_nor.dart';

class HomePageDesign extends StatefulWidget {
  @override
  _HomePageDesignState createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  @override
  Widget imageCarousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/carousel/1.jpg'),
        AssetImage('images/carousel/2.jpg'),
        AssetImage('images/carousel/3.jpg'),
        AssetImage('images/carousel/4.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 3.0,
      indicatorBgPadding: 5.0,
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          imageCarousel,
          new Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15, bottom: 25),
            child: InkWell(
                  onTap: () =>
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (context) =>  SecondClsNor())),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: mainLine(),
                        ),
                      ),
                      Container(
                          width: 250,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                image: AssetImage('images/homepage/mainLine.jpg'),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            ),
          ),
           new Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: costalLine(),
                        ),
                      ),
                      Container(
                          width: 250,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                image: AssetImage('images/homepage/costalLine.jpg'),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
           new Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: northLine(),
                        ),
                      ),
                      Container(
                          width: 250,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                image: AssetImage('images/homepage/northLine.jpg'),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
           new Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: otherLines(),
                        ),
                      ),
                      Container(
                          width: 250,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                                image: AssetImage('images/carousel/1.jpg'),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget mainLine() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1, right: 5),
          child: Container(
              child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Main Line", style: TextStyle(fontSize: 16),),
                          Text("Colombo to"+ "\n" +"Kandy,Badulla",  style: TextStyle(fontSize: 10)),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
  Widget costalLine() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1, right: 5),
          child: Container(
              child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Costal Line", style: TextStyle(fontSize: 16),),
                          Text("Colombo to"+ "\n" +"Galle,Matara",  style: TextStyle(fontSize: 10)),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
  Widget northLine() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Container(
              child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Northern Line", style: TextStyle(fontSize: 16),),
                          Text("Colombo to"+ "\n" +"Anuradapura,Jaffna",  style: TextStyle(fontSize: 10)),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
  Widget otherLines() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Container(
              child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Other Lines", style: TextStyle(fontSize: 16),),
                          Text("Colombo to"+ "\n" +"Batticol,Polonnaruwa,Trincomalee",  style: TextStyle(fontSize: 10)),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
}
