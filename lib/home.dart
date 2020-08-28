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

  void _showDialog(String title,int DiedSheep,
  int DiedSheepBabyMale,
  int DiedSheepAdultMale,
  int DiedSheepBabyFemale,
  int DiedSheepAdultFemale,
  int MissingSheep,
  int MissingSheepBabyMale,
  int MissingSheepAdultMale,
  int MissingSheepBabyFemale,
  int MissingSheepAdultFemale,
  int SlaughterSheep,
  int SlaughterSheepBabyMale,
  int SlaughterSheepAdultMale,
  int SlaughterSheepBabyFemale,
  int SlaughterSheepAdultFemale,
  int AliveSheep,
  int AliveSheepBabyMale,
  int AliveSheepAdultMale,
  int AliveSheepBabyFemale,
  int AliveSheepAdultFemale,
      int Total) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          contentPadding: EdgeInsets.all(0),
          content:Table(
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
            border: TableBorder.all(
                color: Colors.black26, width: 1, style: BorderStyle.solid),
            children: [
              TableRow(children: [
                TableCell(child: Center(child: Text(title,style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text('Male',style:TextStyle(fontSize: 11))),
                ),
                TableCell(child: Center(child: Text('Male',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Female',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Female',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text(''))),
              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text(""))),
                TableCell(
                  child: Center(child: Text('Adult',style:TextStyle(fontSize: 11))),
                ),
                TableCell(child: Center(child: Text('Baby',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Adult',style:TextStyle(fontSize:11)))),
                TableCell(child: Center(child: Text('Baby',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Total',style:TextStyle(fontSize: 11)))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Alive",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(AliveSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(AliveSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(AliveSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(AliveSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(AliveSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Slaugtered",style:TextStyle(fontSize: 8)))),
                TableCell(
                  child: Center(child: Text(SlaughterSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(SlaughterSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Died",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(DiedSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(DiedSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(DiedSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(DiedSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(DiedSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Missing",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(MissingSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(MissingSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(MissingSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(MissingSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(MissingSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Total",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text((AliveSheepAdultMale+SlaughterSheepAdultMale+DiedSheepAdultMale+MissingSheepAdultMale).toString())),
                ),
                TableCell(child: Center(child: Text((AliveSheepBabyMale+SlaughterSheepBabyMale+DiedSheepBabyMale+MissingSheepBabyMale).toString()))),
                TableCell(child: Center(child: Text((AliveSheepAdultFemale+SlaughterSheepAdultFemale+DiedSheepAdultFemale+MissingSheepAdultFemale).toString()))),
                TableCell(child: Center(child: Text((AliveSheepBabyFemale+SlaughterSheepBabyFemale+DiedSheepBabyFemale+MissingSheepBabyFemale).toString()))),
                TableCell(child: Center(child: Text(Total.toString()))),

              ]),

            ],
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


  void _showDialog1(String title,int DiedSheep,
      int DiedSheepBabyMale,
      int DiedSheepAdultMale,
      int DiedSheepBabyFemale,
      int DiedSheepAdultFemale,
      int MissingSheep,
      int MissingSheepBabyMale,
      int MissingSheepAdultMale,
      int MissingSheepBabyFemale,
      int MissingSheepAdultFemale,
      int SlaughterSheep,
      int SlaughterSheepBabyMale,
      int SlaughterSheepAdultMale,
      int SlaughterSheepBabyFemale,
      int SlaughterSheepAdultFemale,
      int AliveSheep,
      int AliveSheepBabyMale,
      int AliveSheepAdultMale,
      int AliveSheepBabyFemale,
      int AliveSheepAdultFemale,
      int Total) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Animals"),
          contentPadding: EdgeInsets.all(0),
          content:Table(
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
            border: TableBorder.all(
                color: Colors.black26, width: 1, style: BorderStyle.solid),
            children: [
              TableRow(children: [
                TableCell(child: Center(child: Text(title,style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text('Male',style:TextStyle(fontSize: 11))),
                ),
                TableCell(child: Center(child: Text('Male',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Female',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Female',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text(''))),
              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text(""))),
                TableCell(
                  child: Center(child: Text('Adult',style:TextStyle(fontSize: 11))),
                ),
                TableCell(child: Center(child: Text('Baby',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Adult',style:TextStyle(fontSize:11)))),
                TableCell(child: Center(child: Text('Baby',style:TextStyle(fontSize: 11)))),
                TableCell(child: Center(child: Text('Total',style:TextStyle(fontSize: 11)))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Sheep",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(AliveSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(AliveSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(AliveSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(AliveSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(AliveSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Camel",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(SlaughterSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(SlaughterSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(SlaughterSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Horse",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(DiedSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(DiedSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(DiedSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(DiedSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(DiedSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Goat",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text(MissingSheepAdultMale.toString())),
                ),
                TableCell(child: Center(child: Text(MissingSheepBabyMale.toString()))),
                TableCell(child: Center(child: Text(MissingSheepAdultFemale.toString()))),
                TableCell(child: Center(child: Text(MissingSheepBabyFemale.toString()))),
                TableCell(child: Center(child: Text(MissingSheep.toString()))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text("Total",style:TextStyle(fontSize: 11)))),
                TableCell(
                  child: Center(child: Text((AliveSheepAdultMale+SlaughterSheepAdultMale+DiedSheepAdultMale+MissingSheepAdultMale).toString())),
                ),
                TableCell(child: Center(child: Text((AliveSheepBabyMale+SlaughterSheepBabyMale+DiedSheepBabyMale+MissingSheepBabyMale).toString()))),
                TableCell(child: Center(child: Text((AliveSheepAdultFemale+SlaughterSheepAdultFemale+DiedSheepAdultFemale+MissingSheepAdultFemale).toString()))),
                TableCell(child: Center(child: Text((AliveSheepBabyFemale+SlaughterSheepBabyFemale+DiedSheepBabyFemale+MissingSheepBabyFemale).toString()))),
                TableCell(child: Center(child: Text(Total.toString()))),

              ]),

            ],
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
                  flex: 3,
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
                  flex: 3,
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
                                        _showDialog("Goat", DiedGoat,
                                             DiedGoatBabyMale,
                                            DiedGoatAdultMale,
                                             DiedGoatBabyFemale,
                                             DiedGoatAdultFemale,
                                             MissingGoat,
                                             MissingGoatBabyMale,
                                             MissingGoatAdultMale,
                                             MissingGoatBabyFemale,
                                             MissingGoatAdultFemale,
                                             SlaughterGoat,
                                            SlaughterGoatBabyMale,
                                             SlaughterGoatAdultMale,
                                             SlaughterGoatBabyFemale,
                                             SlaughterGoatAdultFemale,
                                             AliveGoat,
                                             AliveGoatBabyMale,
                                             AliveGoatAdultMale,
                                             AliveGoatBabyFemale,
                                             AliveGoatAdultFemale,
                                        TotalGoat);
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
                                      _showDialog("Horse",DiedHorse,
                                          DiedHorseBabyMale,
                                          DiedHorseAdultMale,
                                          DiedHorseBabyFemale,
                                          DiedHorseAdultFemale,
                                          MissingHorse,
                                          MissingHorseBabyMale,
                                          MissingHorseAdultMale,
                                          MissingHorseBabyFemale,
                                          MissingHorseAdultFemale,
                                          SlaughterHorse,
                                          SlaughterHorseBabyMale,
                                          SlaughterHorseAdultMale,
                                          SlaughterHorseBabyFemale,
                                          SlaughterHorseAdultFemale,
                                          AliveHorse,
                                          AliveHorseBabyMale,
                                          AliveHorseAdultMale,
                                          AliveHorseBabyFemale,
                                          AliveHorseAdultFemale,
                                          TotalHorse);
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
                    child:  Align(
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
                          _showDialog1("",AliveSheep,
                              AliveSheepBabyMale,
                              AliveSheepAdultMale,
                              AliveSheepBabyFemale,
                              AliveSheepAdultFemale,

                              AliveCamel,
                              AliveCamelBabyMale,
                              AliveCamelAdultMale,
                              AliveCamelBabyFemale,
                              AliveCamelAdultFemale,

                              AliveHorse,
                              AliveHorseBabyMale,
                              AliveHorseAdultMale,
                              AliveHorseBabyFemale,
                              AliveHorseAdultFemale,

                              AliveGoat,
                              AliveGoatBabyMale,
                              AliveGoatAdultMale,
                              AliveGoatBabyFemale,
                              AliveGoatAdultFemale,

                              AliveGoat+AliveSheep+AliveCamel+AliveHorse);
                        },
                        child: Text("Total: "+(noOfGoats+noOfCamel+noOfSheeps+noOfHorse).toString(),style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                      ),
                    )
                )
                ,
                Flexible(
                  flex: 3,
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
                                        _showDialog("Sheep",DiedSheep,
                                            DiedSheepBabyMale,
                                            DiedSheepAdultMale,
                                            DiedSheepBabyFemale,
                                            DiedSheepAdultFemale,
                                            MissingSheep,
                                            MissingSheepBabyMale,
                                            MissingSheepAdultMale,
                                            MissingSheepBabyFemale,
                                            MissingSheepAdultFemale,
                                            SlaughterSheep,
                                            SlaughterSheepBabyMale,
                                            SlaughterSheepAdultMale,
                                            SlaughterSheepBabyFemale,
                                            SlaughterSheepAdultFemale,
                                            AliveSheep,
                                            AliveSheepBabyMale,
                                            AliveSheepAdultMale,
                                            AliveSheepBabyFemale,
                                            AliveSheepAdultFemale,
                                            TotalSheep);
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
                                        _showDialog("Camel",DiedCamel,
                                            DiedCamelBabyMale,
                                            DiedCamelAdultMale,
                                            DiedCamelBabyFemale,
                                            DiedCamelAdultFemale,
                                            MissingCamel,
                                            MissingCamelBabyMale,
                                            MissingCamelAdultMale,
                                            MissingCamelBabyFemale,
                                            MissingCamelAdultFemale,
                                            SlaughterCamel,
                                            SlaughterCamelBabyMale,
                                            SlaughterCamelAdultMale,
                                            SlaughterCamelBabyFemale,
                                            SlaughterCamelAdultFemale,
                                            AliveCamel,
                                            AliveCamelBabyMale,
                                            AliveCamelAdultMale,
                                            AliveCamelBabyFemale,
                                            AliveCamelAdultFemale,
                                            TotalCamel);
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
                  flex: 3,
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
                                        child: Text(loginName.toString())
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
  
