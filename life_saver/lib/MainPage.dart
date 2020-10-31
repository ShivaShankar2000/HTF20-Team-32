import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_saver/HomePage.dart';
import 'package:life_saver/maps.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key,this.user,this.emergency}) : super(key: key);
  final String user;
  final String emergency;
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  int _currentIndex=0;
  void onTabTapped(index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainPage(user: widget.user,
              )));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_currentIndex == 0
          ? HomePage(user: widget.user,emergency:widget.emergency)
          : MapsPage()),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped,
        elevation: 30,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 32),
              label: "home"),
          BottomNavigationBarItem(
              icon:Icon( Icons.map,size : 32),
              label: "Stats"),
        ],
      ),
    );
  }

}