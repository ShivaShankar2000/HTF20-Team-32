import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
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
                  child: Text("Welcome John",style: TextStyle(fontSize: 25,color: Colors.white),),
                ),
                Padding(
                  padding:  EdgeInsets.all(25.0),
                  child: Text("Location",style: TextStyle(fontSize: 20,color: Colors.white)),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("Emergency Assistance",style: TextStyle(fontSize: 15,color: Colors.grey)),
          ),
          Row(
            children: [
              Container(
                child: FlatButton(

                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}
