import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    List<Color> _colors = [Colors.deepPurpleAccent, Colors.yellow];
    List<double> _stops = [0.3, 0.9];
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height/3.5,
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:100.0),
                  child: Text("",style: TextStyle(fontSize: 25,color: Colors.white),),
                ),
                Padding(
                  padding:  EdgeInsets.all(25.0),
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