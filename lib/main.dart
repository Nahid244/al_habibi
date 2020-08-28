
import 'package:al_habibi/login.dart';
import 'package:al_habibi/root.dart';
import 'package:flutter/material.dart';
import 'package:al_habibi/publicdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp_State();
  }

  // This widget is the root of your application.
}
class MyApp_State extends State<MyApp>{
  bool CheckValue;
  bool tmp=false;
  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    tmp  = prefs.getBool('loginValue');
    loginType=prefs.getString('loginType');
    loginName=prefs.getString('loginName');
    print("sdsd $tmp $loginType $loginName");
    setState(() {
      loadedLoginData=true;
    });


  }
  _get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

     CheckValue = prefs.containsKey('loginValue');
     if(CheckValue){
       getBoolValuesSF();
     }
     else{
       setState(() {
         loadedLoginData=true;
       });
     }
  }

  @override
  Widget build(BuildContext context) {

    if(loadedLoginData==false){
      _get();
      return WillPopScope(
          child: MaterialApp(
            home: Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          onWillPop: () async => false
      );
    }
    else{
      if(tmp){
        return WillPopScope(
            child: MaterialApp(
              home:Root(),
            ),
            onWillPop: () async => false
        );
      }
      else{
        return WillPopScope(
            child: MaterialApp(
              home:Login(),
              //  home:Root()
            ),
            onWillPop: () async => false
        );
      }
    }

//



  }

}
