import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_saver/HomePage.dart';
import 'package:life_saver/maps.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key,this.user}) : super(key: key);
  final String user;
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
          ? HomePage(user: widget.user,)
          : MapsPage()),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped,
        elevation: 30,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/homenav.svg'),
              activeIcon: SvgPicture.asset('assets/homenav2.svg'),
              label: "home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/statnav2.svg'),
              activeIcon: SvgPicture.asset('assets/statsnav.svg'),
              label: "Stats"),
        ],
      ),
    );
  }

}