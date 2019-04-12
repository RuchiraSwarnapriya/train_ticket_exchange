import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];
  @override

  Widget build(BuildContext context) {

  Widget image_carousel = new Container(
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
      showIndicator: false,
    ),
  );


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('My Tickets')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('MyAccount')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
