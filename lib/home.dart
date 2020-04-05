import 'dart:convert';
import 'dart:io';

import 'package:al_habibi/login.dart';
import 'package:al_habibi/publicdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Home_State();
  }
  
}
class Home_State extends State<Home>{

  void _showDialog(String title,int a,int b,int c,int d) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),

          content:Container(

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(

                      color: Colors.green,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      },
                      child: Text("Died: "+a.toString(),style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(

                      color: Colors.green,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      },
                      child: Text("Missing: "+b.toString(),style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(

                      color: Colors.green,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      },
                      child: Text("Slaughtered: "+c.toString(),style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(

                      color: Colors.green,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      },
                      child: Text("Alive: "+d.toString(),style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    ),
                  )
                ],
              ),
            )
          )

          ,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color: Colors.green,
              textColor: Colors.black,

              // disabledColor: Colors.grey,
              // disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.black)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("loginValue");
    prefs.remove("loginType");
    prefs.remove("loginName");
    exit(0);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/main_logo_lite.jpg"),
                    fit: BoxFit.contain
                )
            ),
            child: Column(
              children: <Widget>[
//                Flexible(
//                  flex: 1,
//                  child: Row(
//                    children: <Widget>[
////                      Flexible(
////                          flex: 1,
////                          child:  Center(
////
////                            child: FlatButton(
////                              color: Colors.green,
////                              textColor: Colors.black,
////
////                              // disabledColor: Colors.grey,
////                              // disabledTextColor: Colors.black,
////                              padding: EdgeInsets.all(8.0),
////                              splashColor: Colors.blueAccent,
////                              shape: RoundedRectangleBorder(
////                                  borderRadius: new BorderRadius.circular(50.0),
////                                  side: BorderSide(color: Colors.black)
////                              ),
////                              onPressed: () {
////
////                              },
////                              child: Text(loginType.toString()+" : "+loginName,style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
////                            ),
////
////                          )
////                      ),
//                     Column(
//                       children: <Widget>[
//                                            Flexible(
//                          flex: 1,
//                          child:  Center(
//
//                            child: FlatButton(
//                              color: Colors.green,
//                              textColor: Colors.black,
//
//                              // disabledColor: Colors.grey,
//                              // disabledTextColor: Colors.black,
//                              padding: EdgeInsets.all(2.0),
//                              splashColor: Colors.blueAccent,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: new BorderRadius.circular(50.0),
//                                  side: BorderSide(color: Colors.black)
//                              ),
//                              onPressed: () {
//
//                              },
//                              child: Text(loginType.toString()+" : "+loginName),
//                            ),
//
//                          )
//                      ),
//                                            Flexible(
//                                                flex: 1,
//                                                child:  Center(
//
//                                                  child: FlatButton(
//                                                    color: Colors.green,
//                                                    textColor: Colors.black,
//
//                                                    // disabledColor: Colors.grey,
//                                                    // disabledTextColor: Colors.black,
//                                                    padding: EdgeInsets.all(8.0),
//                                                    splashColor: Colors.blueAccent,
//                                                    shape: RoundedRectangleBorder(
//                                                        borderRadius: new BorderRadius.circular(40.0),
//                                                        side: BorderSide(color: Colors.black)
//                                                    ),
//                                                    onPressed: () {
//                                                     exit(0);
//                                                    },
//                                                    child: Text("exit",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//                                                  ),
//
//                                                )
//                                            ),
//                                            Flexible(
//                                                flex: 1,
//                                                child:  Center(
//
//                                                  child: FlatButton(
//                                                    color: Colors.green,
//                                                    textColor: Colors.black,
//
//                                                    // disabledColor: Colors.grey,
//                                                    // disabledTextColor: Colors.black,
//                                                    padding: EdgeInsets.all(8.0),
//                                                    splashColor: Colors.blueAccent,
//                                                    shape: RoundedRectangleBorder(
//                                                        borderRadius: new BorderRadius.circular(40.0),
//                                                        side: BorderSide(color: Colors.black)
//                                                    ),
//                                                    onPressed: () {
//                                                      removeValues();
//
//                                                    },
//                                                    child: Text("Logout",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//                                                  ),
//
//                                                )
//                                            ),
//                       ],
//                     )
//                     ,
//                      Flexible(
//                          flex: 1,
//                          child:  Center(
//
//                            child: FlatButton(
//                              color: Colors.green,
//                              textColor: Colors.black,
//
//                              // disabledColor: Colors.grey,
//                              // disabledTextColor: Colors.black,
//                              padding: EdgeInsets.all(8.0),
//                              splashColor: Colors.blueAccent,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: new BorderRadius.circular(50.0),
//                                  side: BorderSide(color: Colors.black)
//                              ),
//                              onPressed: () {
//
//                              },
//                              child: Text("A/E",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//                            ),
//
//                          )
//                      )
//                    ],
//                  ),
//                ),
              Container(
                padding: EdgeInsets.all(10),
              )
              ,
                Flexible(
                  flex: 1,
                    child: Container(
                      decoration:  BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage("images/upper.jpg"),
                              fit: BoxFit.fill
                          )
                      ),
                    )
                )
                ,

                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child:Container(
                              decoration: BoxDecoration(

                                  image: DecorationImage(
                                      image: AssetImage("images/goat.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {
                                        _showDialog("Goat",DiedGoat,MissingGoat,SlaughterGoat,TotalGoat);
                                      },
                                      child: Text("Goat: "+noOfGoats.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/horse.png"),
                                    fit: BoxFit.contain
                                )
                            ),
                            child:  Scaffold(
                                backgroundColor: Colors.transparent,
                                body:  Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FlatButton(
                                    color: Colors.white,
                                    textColor: Colors.black,

                                    // disabledColor: Colors.grey,
                                    // disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(50.0),
                                        side: BorderSide(color: Colors.black)
                                    ),
                                    onPressed: () {
                                      _showDialog("Horse",DiedHorse,MissingHorse,SlaughterHorse,TotalHorse);
                                    },
                                    child: Text("Horse: "+noOfHorse.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                  ),
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/sheep.png"),
                                      fit: BoxFit.contain
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {
                                        _showDialog("Sheep",DiedSheep,MissingSheep,SlaughterSheep,TotalSheep);
                                      },
                                      child: Text("Sheep: "+noOfSheeps.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/camel.png"),
                                      fit: BoxFit.contain
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {
                                        _showDialog("Camel",DiedCamel,MissingCamel,SlaughterCamel,TotalCamel);
                                      },
                                      child: Text("Camel: "+noOfCamel.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                          Container(
                          padding: EdgeInsets.all(10),
                        )

                              ,
                             Flexible(
                                 flex: 1,
                                 child:  FlatButton(
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

                                       removeValues();


                                     },
                                     child: Text("logout")
                                 )
                             ),
                             Flexible(
                                 flex: 1,
                                 child:  FlatButton(
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
                                     child: Text("Exit")
                                 )
                             )
                            ],
                          ),
                        )
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage("images/Habibilogo.png"),
                                  fit: BoxFit.contain
                              )
                          ),

                        ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                )

                                ,
                                Flexible(
                                    flex: 1,
                                    child:  FlatButton(
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



                                        },
                                        child: Text(loginType+" :"+loginName)
                                    )
                                ),
                                Flexible(
                                    flex: 1,
                                    child:  FlatButton(
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



                                        },
                                        child: Text("A/E")
                                    )
                                )
                              ],
                            ),
                          )
                      ),

                    ],
                  )
                )
              ],
            ),
          ),
        );

    }
  }
  /*
  * Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/main_logo_lite.jpg"),
                    fit: BoxFit.contain
                )
            ),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
//                      Flexible(
//                          flex: 1,
//                          child:  Center(
//
//                            child: FlatButton(
//                              color: Colors.green,
//                              textColor: Colors.black,
//
//                              // disabledColor: Colors.grey,
//                              // disabledTextColor: Colors.black,
//                              padding: EdgeInsets.all(8.0),
//                              splashColor: Colors.blueAccent,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: new BorderRadius.circular(50.0),
//                                  side: BorderSide(color: Colors.black)
//                              ),
//                              onPressed: () {
//
//                              },
//                              child: Text(loginType.toString()+" : "+loginName,style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//                            ),
//
//                          )
//                      ),
                     Column(
                       children: <Widget>[
                                            Flexible(
                          flex: 2,
                          child:  Center(

                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.black,

                              // disabledColor: Colors.grey,
                              // disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.black)
                              ),
                              onPressed: () {

                              },
                              child: Text(loginType.toString()+" : "+loginName,style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                            ),

                          )
                      ),
                                            Flexible(
                                                flex: 1,
                                                child:  Center(

                                                  child: FlatButton(
                                                    color: Colors.green,
                                                    textColor: Colors.black,

                                                    // disabledColor: Colors.grey,
                                                    // disabledTextColor: Colors.black,
                                                    padding: EdgeInsets.all(8.0),
                                                    splashColor: Colors.blueAccent,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(40.0),
                                                        side: BorderSide(color: Colors.black)
                                                    ),
                                                    onPressed: () {
                                                     exit(0);
                                                    },
                                                    child: Text("exit",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                                  ),

                                                )
                                            ),
                                            Flexible(
                                                flex: 1,
                                                child:  Center(

                                                  child: FlatButton(
                                                    color: Colors.green,
                                                    textColor: Colors.black,

                                                    // disabledColor: Colors.grey,
                                                    // disabledTextColor: Colors.black,
                                                    padding: EdgeInsets.all(8.0),
                                                    splashColor: Colors.blueAccent,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(40.0),
                                                        side: BorderSide(color: Colors.black)
                                                    ),
                                                    onPressed: () {
                                                      removeValues();
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => Login()),

                                                      );
                                                    },
                                                    child: Text("Logout",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                                  ),

                                                )
                                            ),
                       ],
                     )
                     ,
                      Flexible(
                          flex: 1,
                          child:  Center(

                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.black,

                              // disabledColor: Colors.grey,
                              // disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.black)
                              ),
                              onPressed: () {

                              },
                              child: Text("A/E",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                            ),

                          )
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child:Container(
                              decoration: BoxDecoration(

                                  image: DecorationImage(
                                      image: AssetImage("images/goat.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {

                                      },
                                      child: Text("Goat: "+noOfGoats.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/horse.png"),
                                    fit: BoxFit.contain
                                )
                            ),
                            child:  Scaffold(
                                backgroundColor: Colors.transparent,
                                body:  Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FlatButton(
                                    color: Colors.white,
                                    textColor: Colors.black,

                                    // disabledColor: Colors.grey,
                                    // disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(50.0),
                                        side: BorderSide(color: Colors.black)
                                    ),
                                    onPressed: () {

                                    },
                                    child: Text("Horse: "+noOfHorse.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                  ),
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/sheep.png"),
                                      fit: BoxFit.contain
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {

                                      },
                                      child: Text("Sheep: "+noOfSheeps.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child:  Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/camel.png"),
                                      fit: BoxFit.contain
                                  )
                              ),
                              child:Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body:  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.black,

                                      // disabledColor: Colors.grey,
                                      // disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide(color: Colors.black)
                                      ),
                                      onPressed: () {

                                      },
                                      child: Text("Camel: "+noOfCamel.toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                                    ),
                                  )
                              )
                          )
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/Habibilogo.png"),
                            fit: BoxFit.contain
                        )
                    ),

                  ),
                )
              ],
            ),
          ),
        );*/
  
