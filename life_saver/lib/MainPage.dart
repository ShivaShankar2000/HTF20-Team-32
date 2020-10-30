import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
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
              builder: (BuildContext context) => MainPage(
              )));
    }
  }
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return Scaffold(
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
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/profilenav2.svg'),
              activeIcon: SvgPicture.asset('assets/profilenav.svg'),
              label: "profile"),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: height/3.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.indigo,
                    Colors.teal
                  ]),
      ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:120.0),
                  child: Text("",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
                Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Text("",style: TextStyle(fontSize: 20,color: Colors.white)),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("Emergency Assistance",style: TextStyle(fontSize: 15,color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width/2.5,
                  height: height/5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Text("Health".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                ),
                Container(
                  width: width/2.5,
                  height: height/5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Text("Fire".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width/2.5,
                  height: height/5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Text("Accident".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                ),
                Container(
                  width: width/2.5,
                  height: height/5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Text("Police".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("Alert your Emergency Contact",style: TextStyle(fontSize: 15,color: Colors.grey)),
          ),
          CircleAvatar(
              radius: 35,
              backgroundColor:
              Colors.red[800],
              child: CircleAvatar(
                child: Icon(Icons.alarm,color: Colors.white,size: 30,),
                radius: 29,
                backgroundColor: Colors.red.shade300,
              ))
        ],
      ),
    );
  }

}