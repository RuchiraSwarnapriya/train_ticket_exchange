import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:train_ticket_exchange/pages/myaccount.dart';
import 'package:train_ticket_exchange/pages/mytickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:train_ticket_exchange/pages/signInpage.dart';
import 'package:train_ticket_exchange/components/horizontallistview.dart';
import 'package:train_ticket_exchange/components/recentTicketListView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      body:CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            inactiveColor: CupertinoColors.inactiveGray,
            activeColor: CupertinoColors.activeBlue,
            items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('My Ticekts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('My Account'),
          ),
        ]),
        tabBuilder: (context, index){
          return CupertinoTabView(
            builder: (context){
              switch (index){
                case 0:
                  return HomePageDesign();
                  break;
                case 1:
                  return MyTickets();
                  break;
                case 2:
                  return SignIn();
                  break;

                default:
                  return Container();}
            }
          );
        }
      ),
    );
  }
}

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
        children: <Widget>[
          imageCarousel,
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Text("Categories", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Text("Recent Tickets", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
          new Container(
            height: 200.0,

            child: RecentTickets(),
          )
        ],
      ),
    );
  }
}



