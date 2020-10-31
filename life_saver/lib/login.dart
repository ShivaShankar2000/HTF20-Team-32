import 'package:flutter/material.dart';
import 'package:life_saver/MainPage.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController EController = TextEditingController();
  bool flag  = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:20.0, bottom: 100),
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Life Saver',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: EController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Emergency Number',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:30.0,bottom: 20),
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Get OTP'),
                          onPressed: () {
                            setState(() {
                              flag = true;
                            });
                          },
                        )),
                  ),
                  Visibility(
                    visible: flag,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'OTP',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: flag,
                    child: Padding(
                      padding: EdgeInsets.only(top:30.0,bottom: 20),
                      child: Container(
                          height: 50,
                          width: 250,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            color: Colors.blue,
                            child: Text('Login'),
                            onPressed: () {
                              setState(() {
                                flag = true;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MainPage(user: nameController.text,emergency:EController.text)));
                            },
                          )),
                    ),
                  ),
                ],
              )),
        ));
  }
}