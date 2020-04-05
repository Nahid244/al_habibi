import 'dart:io';

import 'package:al_habibi/publicdata.dart';
import 'package:al_habibi/root.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Login_State();
  }

}
class Login_State extends State<Login> {

  static Widget but_txt = but_txt1;
  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginValue', true);
    prefs.setString('loginType', loginType);
    prefs.setString('loginName', loginName);

  }

  BuildContext context1;

  _makePostRequest() async {
    String url = 'https://alhabibifarm.secretdevbd.com/API/Login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"Email": "' + logGmail + '", "Pass": "' + logPass +
        '"}';

    var response = await http.post(url, headers: headers, body: json);

    String body = response.body;
    print(body);

    var data = jsonDecode(body);


    setState(() {
      but_txt = but_txt1;
      if(data["status"]==1){
        addBoolToSF();
        loginType=data["type"];
        loginName=data["name"];
        Navigator.pop(context1);
        Navigator.push(
          context1,
          MaterialPageRoute(builder: (context) => Root()),

        );
      }
      else{
        but_txt=but_txt3;
      }

    });




  }


  @override
  Widget build(BuildContext context) {
    context1 = context;

    // TODO: implement build
    return WillPopScope(
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Color.fromRGBO(177,204,159,1),
            body: SingleChildScrollView(
              child: Container(

                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(70)
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      //child: Text("sddddddddddddddddddd"),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/Habibilogo.png"),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),

                        child: TextField(
                          onChanged: (Text) {
                            logGmail = Text.toString();
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.verified_user),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Enter e-mail'
                          ),
                        )

                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),

                        child: TextField(
                          onChanged: (Text) {
                            logPass = Text.toString();
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Enter password'
                          ),
                        )

                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),

                        child: FlatButton(
                            color: Colors.lightGreen,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.black)
                            ),
                            onPressed: () {
                              loadedCountData=false;
                              print(logGmail);
                              print(logPass);
                              setState(() {
                                if(logGmail==null || logPass==null){
                                  but_txt=but_txt3;
                                }
                                else{
                                  but_txt = but_txt2;
                                  _makePostRequest();
                                }

                              });
                              print("sd");
                            },
                            child: but_txt
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),

                        child: FlatButton(
                            color: Colors.lightGreen,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.black)
                            ),
                            onPressed: () {
                              exit(0);

                            },
                            child:Text("Exit")
                        )
                    ),



                  ],
                ),
              )
            ),
          ),
        ),
        onWillPop: () async => false
    );
  }

}