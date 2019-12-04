import 'package:flutter/material.dart';

import 'package:train_ticket_exchange/pages/mainLine/ticketTypes/1st_cls_ac.dart';
import 'package:train_ticket_exchange/pages/mainLine/ticketTypes/1st_cls_nor.dart';
import 'package:train_ticket_exchange/pages/mainLine/ticketTypes/1st_cls_obv.dart';
import 'package:train_ticket_exchange/pages/mainLine/ticketTypes/2nd_cls_nor.dart';
import 'package:train_ticket_exchange/pages/mainLine/ticketTypes/3rd_cls_nor.dart';

class MainLineCatogries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
              onTap: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> FirstClsObv())),
              child: Category(
                imageLocation: "images/ticketcato/1stclassobservation.png",
              ),
          ),
          GestureDetector(
              onTap: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> FirstClsAC())),
              child: Category(
                imageLocation: "images/ticketcato/1stclassac.png",
              )
          ),
          GestureDetector(
              onTap: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> FirstClsNor())),
              child: Category(
                imageLocation: "images/ticketcato/1stclassnormal.png",
              )
          ),
          GestureDetector(
              onTap: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> SecondClsNor())),
              child: Category(
                imageLocation: "images/ticketcato/2ndclassnormal.png",
              )
          ),
          GestureDetector(
              onTap: ()=> Navigator.push(context,new MaterialPageRoute(builder: (context)=> ThirdClsNor())),
              child: Category(
                imageLocation: "images/ticketcato/3rdclassnormal.png",
              )
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  Category({
    this.imageLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 120,
        child: ListTile(
          title: Image.asset(
            imageLocation,
          ),
        ),
      ),

    );
  }
}