import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HomePage extends StatefulWidget{
  HomePage({Key key,this.user}) : super(key: key);
  final String user;
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height / 3.5,
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
                  padding: EdgeInsets.only(top: 120.0),
                  child: Text("Hey,  ${widget.user}", style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                      "", style: TextStyle(fontSize: 20, color: Colors.white,)),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Emergency Assistance",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width / 2.5,
                  height: height / 5,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {},
                      color: Colors.grey.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            "assets/sign.svg", width: width / 3.5,),
                          Text("First Aid", style: TextStyle(fontSize: 15))
                        ],
                      )
                  ),

                ),
                Container(
                  width: width / 2.5,
                  height: height / 5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/firefighter.svg", width: width / 3.5,),
                        Text("Fire Emergency",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
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
                  width: width / 2.5,
                  height: height / 5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/accident.svg", width: width / 3.5,),
                        Text("Accident",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width / 2.5,
                  height: height / 5,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/policeman.svg", width: width / 3.5,),
                        Text("Police",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Alert your Emergency Contact",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ),
          CircleAvatar(
              radius: 35,
              backgroundColor:
              Colors.red[800],
              child: CircleAvatar(
                child: Icon(Icons.alarm, color: Colors.white, size: 30,),
                radius: 29,
                backgroundColor: Colors.red.shade300,
              ))
        ],
      ),
    );
  }
}