import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:al_habibi/publicdata.dart';
import 'package:image_picker/image_picker.dart';


class More extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return More_State();
  }

}
class More_State extends State<More>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(177,204,159,1),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              ),
              DropdownButton<String>(
                value: chooseMoreOption,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Colors.deepPurple
                ),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    chooseMoreOption=newValue;
                    if(newValue=="Add Animal"){
                       addanimalVisibility=true;
                       addMultianimalVisibility=false;
                     addownerVisibility=false;
                     addempVisibility=false;
                       searchVisibility=false;
                      updateVisibility=false;

                     missingVisibility=false;
                       slaughteredVisibility=false;
                      vaccineVisibility=false;
                       diedVisibility=false;
                       srchResultVisibility=false;
                       alertVisibility=false;
                       updateStatusVisibility=false;

                    } else if(newValue=="Add Multiple Animal"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=true;
                      addownerVisibility=false;
                      addempVisibility=false;
                      searchVisibility=false;
                      updateVisibility=false;
                      missingVisibility=false;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      srchResultVisibility=false;
                      alertVisibility=false;
                      updateStatusVisibility=false;
                    }
                    else if(newValue=="Add Owner"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=false;
                      if(loginType=="ADMIN"){
                        addownerVisibility=true;
                        alertVisibility=false;
                      }
                      else{
                        addownerVisibility=false;
                        alertVisibility=true;
                      }


                      addempVisibility=false;
                      searchVisibility=false;
                      updateVisibility=false;
                      missingVisibility=false;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      updateStatusVisibility=false;

                    }
                    else if(newValue=="Add Emplyee"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=false;
                      addownerVisibility=false;
                      if(loginType=="ADMIN"){
                        addempVisibility=true;
                        alertVisibility=false;
                      }
                      else{
                        addempVisibility=false;
                        alertVisibility=true;
                      }

                      searchVisibility=false;
                      updateVisibility=false;
                      missingVisibility=false;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      updateStatusVisibility=false;

                    }
                    else if(newValue=="Search"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=false;
                      addownerVisibility=false;
                      addempVisibility=false;
                      searchVisibility=true;
                      updateVisibility=false;
                      missingVisibility=false;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      srchResultVisibility=false;
                      alertVisibility=false;
                      updateStatusVisibility=false;
                    }
                    else if(newValue=="Update Animal"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=false;
                      addownerVisibility=false;
                      addempVisibility=false;
                      searchVisibility=false;
                      updateVisibility=true;
                      missingVisibility=false;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      srchResultVisibility=false;
                      alertVisibility=false;
                      updateStatusVisibility=false;
                    }
                    else if(newValue=="Update Status"){
                      addanimalVisibility=false;
                      addMultianimalVisibility=false;
                      addownerVisibility=false;
                      addempVisibility=false;
                      searchVisibility=false;
                      updateVisibility=false;
                      missingVisibility=false;
                      updateStatusVisibility=true;
                      slaughteredVisibility=false;
                      vaccineVisibility=false;
                      diedVisibility=false;
                      srchResultVisibility=false;
                      alertVisibility=false;
                    }
//                    else if(newValue=="Slaugtered"){
//                      addanimalVisibility=false;
//                      addMultianimalVisibility=false;
//                      addownerVisibility=false;
//                      addempVisibility=false;
//                      searchVisibility=false;
//                      updateVisibility=false;
//                      missingVisibility=false;
//                      slaughteredVisibility=true;
//                      vaccineVisibility=false;
//                      diedVisibility=false;
//                      srchResultVisibility=false;
//                      alertVisibility=false;
//                    }
//                    else if(newValue=="Died"){
//                      addanimalVisibility=false;
//                      addMultianimalVisibility=false;
//                      addownerVisibility=false;
//                      addempVisibility=false;
//                      searchVisibility=false;
//                      updateVisibility=false;
//                      missingVisibility=false;
//                      slaughteredVisibility=false;
//                      vaccineVisibility=false;
//                      diedVisibility=true;
//                      srchResultVisibility=false;
//                      alertVisibility=false;
//                    }
//                    else {
//                      addanimalVisibility=false;
//                      addMultianimalVisibility=false;
//                      addownerVisibility=false;
//                      addempVisibility=false;
//                      searchVisibility=false;
//                      updateVisibility=false;
//                      missingVisibility=false;
//                      slaughteredVisibility=false;
//                      vaccineVisibility=true;
//                      diedVisibility=false;
//                      alertVisibility=false;
//                    }
                  });


                },
                items: moreOption
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
              ),
              Visibility(
                  visible: addanimalVisibility,
                  child:AddAnimal()

              ),
              Visibility(
                visible: addownerVisibility,
                child: AddOwner()
               // Text("addowner"),
              )
              ,
              Visibility(
                visible: addempVisibility,
                child:AddEmp()
                //Text("addemp"),
              )
              ,
              Visibility(
                visible: searchVisibility,
                child:Search()
               // Text("search"),
              )
              ,
              Visibility(
                visible: updateVisibility,
                child: Update()
              )
              ,
              Visibility(
                visible: missingVisibility,
                child: Missing(),
              )
              ,
              Visibility(
                visible: slaughteredVisibility,
                child: Slau(),
              )
              ,
              Visibility(
                visible: diedVisibility,
                child: Died(),
              )
              ,
              Visibility(
                visible: vaccineVisibility,
                child: Vcc(),
              )
,
              Visibility(
                visible: addMultianimalVisibility,
                child: AddAnimalMulti(),
              )
              ,
              Visibility(
                  visible: alertVisibility,
                  child: Center(
                    child: Text("You cant use these feature"),
                  )
              ),

          Visibility(
          visible: updateStatusVisibility,
          child: Center(
            child: Update_Status(),
          )
      ),

            ],
          ),
        ),
      ),
    );
  }

}
////search
class Search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Search_State();
  }

}
class Search_State extends State<Search>{
  static Widget but_txt = but_txt6;

  _srchReq()async{
    srchData.clear();
    String url = 'https://alhabibifarm.secretdevbd.com/API/SearchAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"SearchString": "'+searchTxt+'"}'; // make POST request
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
    var data=jsonDecode(body);

  //  if(srchData.length==0){
      for(var i in data["data"]){
        srchData.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"]),IfNull(i["details"])));
      }
   // }
    setState(() {
     srchResultVisibility=true;
      but_txt=but_txt6;
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                searchTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter Search'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                  print(searchTxt);
                  setState(() {
                    but_txt=but_txt2;
                  });
                  srchResultVisibility=false;
                  _srchReq();

                },
                child:but_txt
            )
        ),

      Container(
        padding: EdgeInsets.only(top: 20),
        child: Visibility(
          visible: srchResultVisibility,
            child: SingleChildScrollView(
              child: Column(
                children:List.generate(srchData.length,(index)
               {
               return Card(
               child: Column(
               children: <Widget>[
               ListTile(
               // leading: Icon(Icons.album),
               title: Text(srchData[index].AnimalTag),
               subtitle: Text(srchData[index].AnimalBreed),
               ),

               ExpansionTile(
               title:  Text("Details", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
               children: <Widget>[
               Image.network(
               'https://alhabibifarm.secretdevbd.com/static/UPLOADS/'+srchData[index].AnimalPictureName,
               height: MediaQuery.of(context).size.height/4,width:  MediaQuery.of(context).size.width,fit: BoxFit.fill,
               ),

               Row(
                 children: <Widget>[
                   Center(

                       child: Column(

                         children: <Widget>[
                           Text("Added Date",textAlign: TextAlign.left,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("Animal Breed",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("Animal Category",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalDOB",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalFather",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalMother",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalID",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalOwner",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalSex",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalStatus",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalStatusCause",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("AnimalStatusDate",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text("UpdatedDate",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                         ],
                       )
                   ),
                   Center(
                       child: Column(
                         children: <Widget>[
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(" : ",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                         ],
                       )
                   ),
                   Center(
                       child: Column(
                         children: <Widget>[
                           Text(srchData[index].AddedDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalBreed,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalCategory,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalDOB,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalFather,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalMother,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalID,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalOwner,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalSex,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalStatus,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalStatusCause,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].AnimalStatusDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                           Text(srchData[index].UpdatedDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                         ],
                       )
                   ),

                 ],
               ),
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("Added Date: "+srchData[index].AddedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("Animal Breed: "+srchData[index].AnimalBreed,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("Animal Category: "+srchData[index].AnimalCategory,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalDOB: "+srchData[index].AnimalDOB,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalFather: "+srchData[index].AnimalFather,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child:  Text("AnimalID: "+srchData[index].AnimalID,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalMother: "+srchData[index].AnimalMother,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child:  Text("AnimalOwner: "+srchData[index].AnimalOwner,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalSex: "+srchData[index].AnimalSex,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalStatus: "+srchData[index].AnimalStatus,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalStatusCause: "+srchData[index].AnimalStatusCause,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("AnimalStatusDate: "+srchData[index].AnimalStatusDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,
//               Align(
//               alignment: Alignment.bottomLeft,
//               child: FlatButton(
//
//               color: Colors.green,
//               textColor: Colors.black,
//               padding: EdgeInsets.all(8.0),
//               splashColor: Colors.blueAccent,
//               shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(50.0),
//               side: BorderSide(color: Colors.black)
//               ),
//               onPressed: () {
//
//               },
//               child: Text("UpdatedDate: "+srchData[index].UpdatedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               ),
//               )
//               ,







               ],

               ),
               ],
               ),
               );
               }

              ),
            )
        )
      ))
      ],
    );
  }

}
///add animal
class AddAnimal extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddAnimal_State();
  }

}
class AddAnimal_State extends State<AddAnimal>{
  static Widget but_txt = but_txt5;

  List<String> motherList=motherListGoat;
  List<String> fatherList= fatherListGoat;
  String details="No details";
  File file;
  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(file.path);
  }

  Future _imageupload() async{



    if(file!=null){

      String url='https://alhabibifarm.secretdevbd.com/PHP/uploadImage.php';


      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(
          await http.MultipartFile.fromPath(
              'AnimalPictureFile',
              file.path
          )
      );


      // http.StreamedResponse res = await request.send();
      request.send().then((response) {

        response.stream.transform(utf8.decoder).listen((value) {
          //String data=jsonDecode(value);
          print(value);
          String a=value.replaceAll(":", ",");
          a=a.replaceAll("}", "");
          a=a.replaceAll("{", "");
          List<String> s=a.split(",");
          String ss=s[1].substring(1);
          choosePicForAdd=ss.substring(0,ss.length-1);
          print(choosePicForAdd);
          if(choosePicForAdd!=null){
            _addanimalReq();
//           setState(() {
//             but_txt1=but_txt3;
//           });

          }

          //print(data);
        });
      });

    }
    else{
      choosePicForAdd="null.jpg";
      _addanimalReq();
    }




  }
  _addanimalReq()async{
    String s1=dayChooseforAddAnimal+'-'+monthChooseforAddAnimal+'-'+yearChooseforAddAnimal;
    String url = 'https://alhabibifarm.secretdevbd.com/API/AddAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalCategory": "'+chooseAnimal+'","AnimalBreed": "'+chooseSubAnimal+'","AnimalSex": "'+chooseSex+'","AnimalAge": "'+chooseAgeForAdd+'","AnimalPictureName": "'+choosePicForAdd+'","details": "'+details.toString()+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    var data=jsonDecode(body);
    print(body);
    print(statusCode);
    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Padding(
              padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (Text) {
                details=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter details'
              ),
            ),
          )
          ,
          Row(
            children: <Widget>[

              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Catagory: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseAnimal ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseAnimal = newValue;
                            if(newValue=="GOAT"){
                              subAnimal=goatAnimal;
                              fatherList=fatherListGoat;
                              motherList=motherListGoat;
                              // subAnimalChose=subAnimal[0];
                            }
                            else if(newValue=="HORSE"){
                              subAnimal=horseAnimal;
                              fatherList=fatherListHorse;
                              motherList=motherListHorse;
                              // subAnimalChose=subAnimal[0];
                            }
                            else if(newValue=="SHEEP"){
                            subAnimal=sheepAnimal;
                            fatherList=fatherListSheep;
                            motherList=motherListSheep;
                              // subAnimalChose=subAnimal[0];
                            }
                            else{
                            subAnimal=camelAnimal;
                            fatherList=fatherListCamel;
                            motherList=motherListCamel;
                              // subAnimalChose=subAnimal[0];
                            }
                            chooseSubAnimal=subAnimal[0];

                          });
                        },
                        items: aAnimal
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Breed: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseSubAnimal ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                         // print(newValue);
                          setState(() {
                            chooseSubAnimal = newValue;


                          });
                        },
                        items: subAnimal
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Sex: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseSex ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseSex = newValue;

                          });
                        },
                        items: sex
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Age: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseAgeForAdd ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseAgeForAdd = newValue;

                          });
                        },
                        items: ageListForAdd
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
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


                   setState(() {
                      _choose();
                   });
                  },
                  child: Text("add image")
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

                    print(chooseAnimal);
                    print(chooseSubAnimal);
                    print(chooseSex);
                    print(chooseOwner);
                    print(chooseFather);
                    print(chooseMother);

                    print('$dayChooseforAddAnimal - $monthChooseforAddAnimal - $yearChooseforAddAnimal');


                  setState(() {
                   // if(file!=null){
                      but_txt=but_txt2;
                 //   }

                  });
                   /// if(file!=null){
                      _imageupload();
                   // }
//                    else{
//                      _showDialog(context);
//                    }

                  },
                  child:but_txt
              )
          ),
        ],
      ),
    );
  }

}///addOwner
class AddOwner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddOwner_State();
  }

}
class AddOwner_State extends State<AddOwner>{
  static Widget but_txt = but_txt5;

  _addOwner()async{
    String url = 'https://alhabibifarm.secretdevbd.com/API/AddOwner';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"OwnerName": "'+ownerNameTxt+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    var data=jsonDecode(body);
    print(body);
    print(statusCode);
    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                ownerNameTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter Owner name'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                 print(ownerNameTxt);

setState(() {
  but_txt=but_txt2;
});

                 _addOwner();
                },
                child:but_txt
            )
        ),

      ],
    );
  }

}
///add emp
class AddEmp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddEmp_State();
  }

}
class AddEmp_State extends State<AddEmp>{
  static Widget but_txt = but_txt5;

  _addEmp()async{
    String url = 'https://alhabibifarm.secretdevbd.com/API/AddEmployee';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"UserName": "'+empNameTxt+'","UserEmail": "'+empMailTxt+'","UserPhone": "'+empPhnTxt+'","UserAddress": "'+empAddTxt+'","UserPass": "'+empPassTxt+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                empNameTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter name'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
               empPhnTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter phone'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                empMailTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter mail'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                empAddTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter address'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: TextField(
              onChanged: (Text) {
                empPassTxt=Text.toString();
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Enter password'
              ),
            )

        ),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                  print(empNameTxt);
                  print(empMailTxt);
                  print(empPhnTxt);
                  print(empAddTxt);
                  print(empPassTxt);
                   setState(() {
                     but_txt=but_txt2;
                   });
                  _addEmp();
                },
                child: but_txt,
            ),

        ),


      ],
    );

  }

}
///update
class Update extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Update_State();
  }

}
class Update_State extends State<Update>{
  static Widget but_txt = but_txt7;
  List<String> motherList=motherListGoat;
  List<String> fatherList= fatherListGoat;
  File file;
  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(file.path);
  }

  Future _imageupload() async{
    if(file!=null){
      String url='https://alhabibifarm.secretdevbd.com/PHP/uploadImage.php';


      var request = http.MultipartRequest('POST', Uri.parse(url));

      if(file==null){
        request.files.add(
            await http.MultipartFile.fromPath(
                'AnimalPictureFile',
                "null.jpg"
            )
        );
      }
      else{
        request.files.add(
            await http.MultipartFile.fromPath(
                'AnimalPictureFile',
                file.path
            )
        );
      }
      // http.StreamedResponse res = await request.send();
      request.send().then((response) {

        response.stream.transform(utf8.decoder).listen((value) {
          //String data=jsonDecode(value);
          String a=value.replaceAll(":", ",");
          a=a.replaceAll("}", "");
          a=a.replaceAll("{", "");
          List<String> s=a.split(",");
          String ss=s[1].substring(1);
          choosePicForupdate=ss.substring(0,ss.length-1);
          print(choosePicForupdate);
          if(choosePicForupdate!=null){
            _updateanimalReq();
//           setState(() {
//             but_txt1=but_txt3;
//           });

          }

          //print(data);
        });
      });
    }
    else{
      choosePicForupdate="null.jpg";
      _updateanimalReq();
    }


  }
  _updateanimalReq()async{
    String s1=dayChooseforUpdate+'-'+monthChooseforUpdate+'-'+yearChooseforUpdate;
    String url = 'https://alhabibifarm.secretdevbd.com/API/UpdateAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+chooseAnimalId.toString() +'","AnimalSex": "'+chooseSexForUpdate+'","AnimalAge": "'+chooseAgeForUpdate+'","AnimalPictureName": "'+choosePicForupdate+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    var data=jsonDecode(body);
    print(body);
    print(statusCode);
    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully updated");
      }
      else{
        but_txt=but_txt3;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Catagory: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseCatForUpdate ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseCatForUpdate = newValue;
                            if(newValue=="GOAT"){
                              subAnimalForUpdate=goatAnimal;

                              // subAnimalChose=subAnimal[0];
                            }
                            else if(newValue=="HORSE"){
                              subAnimalForUpdate=horseAnimal;
                              fatherList=fatherListHorse;
                              motherList=motherListHorse;
                              // subAnimalChose=subAnimal[0];
                            }
                            else if(newValue=="SHEEP"){
                              subAnimalForUpdate=sheepAnimal;
                              fatherList=fatherListSheep;
                              motherList=motherListSheep;
                              // subAnimalChose=subAnimal[0];
                            }
                            else{
                              subAnimalForUpdate=camelAnimal;
                              fatherList=fatherListCamel;
                              motherList=motherListCamel;
                              // subAnimalChose=subAnimal[0];
                            }
                            chooseSubCatForUpdate=subAnimalForUpdate[0];

                          });
                        },
                        items: aAnimal
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Breed: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseSubCatForUpdate ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          // print(newValue);
                          setState(() {
                            chooseSubCatForUpdate = newValue;
                          // animalTagForUpdate.clear();
                           // print(animalTagForUpdateOmani);
                            print(animalTagForUpdateShammal);
                            print(animalTagForUpdateNg);
                            if(newValue=="OMANI"){
                               animalTagForUpdate=animalTagForUpdateOmani;



                            }
                            else if(newValue=="SHAMMAL"){

                              animalTagForUpdate=animalTagForUpdateShammal;
                            }
                            else if(newValue=="NORMAL GOAT"){
                              animalTagForUpdate=animalTagForUpdateNg;

                            }

                            else if(newValue=="TALLAL"){
                              animalTagForUpdate=animalTagForUpdateTallal;

                            }
                            else if(newValue=="SIMMON"){
                              animalTagForUpdate=animalTagForUpdateSimon;

                            }
                            else if(newValue=="SALEH"){
                              animalTagForUpdate=animalTagForUpdateSaleh;

                            }
                            else if(newValue=="ROBBY"){
                              animalTagForUpdate=animalTagForUpdateRobbi;

                            }
                            else if(newValue=="BARBI"){
                              animalTagForUpdate=animalTagForUpdateBarbi;

                            }
                            else if(newValue=="HARRYAT"){
                              animalTagForUpdate=animalTagForUpdateHarrayat;

                            }
                            else if(newValue=="PROJECT"){
                              animalTagForUpdate=animalTagForUpdateProject;

                            }

                            else if(newValue=="BEAUTY"){
                              animalTagForUpdate=animalTagForUpdateBeauty;

                            }
                            else if(newValue=="RACING"){
                              animalTagForUpdate=animalTagForUpdateRacing;

                            }
                            else if(newValue=="BIG"){
                              animalTagForUpdate=animalTagForUpdateBig;

                            }
                            else if(newValue=="SMALL"){
                              animalTagForUpdate=animalTagForUpdateSmall;

                            }
                           print(animalTagForUpdate);

                            chooseAnimalId=animalTagForUpdate[0];
                            print(chooseAnimalId);
                          });
                        },
                        items: subAnimalForUpdate
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Animal Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseAnimalId ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseAnimalId = newValue;

                          });
                        },
                        items:animalTagForUpdate
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Sex: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseSexForUpdate ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseSexForUpdate = newValue;

                          });
                        },
                        items: sex
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Age: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseAgeForUpdate ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseAgeForUpdate = newValue;

                          });
                        },
                        items: ageListForUpdate
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                   setState(() {
                     _choose();
                   });

                    print("sd");
                  },
                  child: Text("take image")
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
//                    print(chooseAnimalId);
//                    print(chooseSexForUpdate);
//                    print(chooseOwnerForUpdate);
//                    print(chooseFatherForUpdate);
//                    print(chooseMotherForUpdate);
//
//                    print('$dayChooseforUpdate - $monthChooseforUpdate - $yearChooseforUpdate');

                  setState(() {
                   // if(file!=null){
                      but_txt=but_txt2;
                   // }
                  });
                 // if(file!=null){
                    _imageupload();
                  //}
//                  else{
//                    _showDialog(context);
//                  }


                  },
                  child:but_txt
              )
          ),
        ],
      )

    );
  }

}
///missing
class Missing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Missing_State();
  }

}
class Missing_State extends State<Missing>{
  static Widget but_txt = but_txt5;

  _addMissing()async{
    String s=dayChooseforMissing+"-"+monthChooseforMissing+"-"+yearChooseforMissing;
    String url = 'https://alhabibifarm.secretdevbd.com/API/MissingAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+tagChooseForMiss+'","Date": "'+s+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:tagChooseForMiss ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            tagChooseForMiss= newValue;

                          });
                        },
                        items: animalTag
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Center(
                    child: Text("Date: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:dayChooseforMissing ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          dayChooseforMissing= newValue;

                        });
                      },
                      items: dayList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:monthChooseforMissing,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          monthChooseforMissing = newValue;

                        });
                      },
                      items: monthList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:yearChooseforMissing ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          yearChooseforMissing = newValue;

                        });
                      },
                      items: yearList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              )
            ],
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
                print(tagChooseForMiss);

                print('$dayChooseforMissing - $monthChooseforMissing - $yearChooseforMissing');
                setState(() {
                  but_txt=but_txt2;
                });
                _addMissing();
              },
              child: but_txt,
            ),

          ),
        ],
      ),
    );
  }

}
///died
class Died extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Died_State();
  }

}
class Died_State extends State<Died>{
  static Widget but_txt = but_txt5;
  _addDied()async{
    String s=dayChooseforDied+"-"+monthChooseforDied+"-"+yearChooseforDied;
    String url = 'https://alhabibifarm.secretdevbd.com/API/DiedAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+tagChooseForDied+'","Date": "'+s+'","Cause": "'+diedTxt+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:tagChooseForDied ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            tagChooseForDied= newValue;

                          });
                        },
                        items: animalTag
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Center(
                    child: Text("Date: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:dayChooseforDied ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          dayChooseforDied= newValue;

                        });
                      },
                      items: dayList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:monthChooseforDied,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          monthChooseforDied = newValue;

                        });
                      },
                      items: monthList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:yearChooseforDied ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          yearChooseforDied = newValue;

                        });
                      },
                      items: yearList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),

              child: TextField(
                onChanged: (Text) {
                  diedTxt=Text.toString();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Enter reason'
                ),
              )

          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                print(tagChooseForDied);
                print(diedTxt);
                print('$dayChooseforDied - $monthChooseforDied - $yearChooseforDied');
                  setState(() {
                    but_txt=but_txt2;
                  });
                _addDied();
              },
              child: but_txt,
            ),

          ),
        ],
      ),
    );
  }

}
///vcc
class Vcc extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Vcc_State();
  }

}
class Vcc_State extends State<Vcc>{
  static Widget but_txt = but_txt5;

  _addVcc()async{
    String s=dayChooseforVcc+"-"+monthChooseforVcc+"-"+yearChooseforVcc;
    String url = 'https://alhabibifarm.secretdevbd.com/API/AddVaccineDetails';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+tagChooseForVcc+'","Date": "'+s+'","Details": "'+vccTxt+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:tagChooseForVcc ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            tagChooseForVcc= newValue;

                          });
                        },
                        items: animalTag
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Center(
                    child: Text("Date: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:dayChooseforVcc,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          dayChooseforVcc= newValue;

                        });
                      },
                      items: dayList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:monthChooseforVcc,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          monthChooseforVcc = newValue;

                        });
                      },
                      items: monthList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:yearChooseforVcc ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          yearChooseforVcc = newValue;

                        });
                      },
                      items: yearList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),

              child: TextField(
                onChanged: (Text) {
                  vccTxt=Text.toString();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Enter Details'
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
                print(tagChooseForVcc);

                print('$dayChooseforVcc - $monthChooseforVcc - $yearChooseforVcc');
                setState(() {
                  but_txt=but_txt2;
                });
                _addVcc();
              },
              child: but_txt,
            ),

          ),
        ],
      ),
    );
  }

}
///slau
class Slau extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Slau_State();
  }

}
class Slau_State extends State<Slau>{
  static Widget but_txt = but_txt5;

  _addSlau()async{
    String s=dayChooseforSlau+"-"+monthChooseforSlau+"-"+yearChooseforSlau;
    String url = 'https://alhabibifarm.secretdevbd.com/API/SlaughterAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+tagChooseForVcc+'","Date": "'+s+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:tagChooseForSlau ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            tagChooseForSlau= newValue;

                          });
                        },
                        items: animalTag
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  child: Center(
                    child: Text("Date: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:dayChooseforSlau,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          dayChooseforSlau= newValue;

                        });
                      },
                      items: dayList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:monthChooseforSlau,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          monthChooseforSlau = newValue;

                        });
                      },
                      items: monthList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: DropdownButton<String>(
                      value:yearChooseforSlau ,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        print(newValue);
                        setState(() {
                          yearChooseforSlau = newValue;

                        });
                      },
                      items: yearList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  )
              )
            ],
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
                print(tagChooseForSlau);

                print('$dayChooseforSlau - $monthChooseforSlau - $yearChooseforSlau');
               setState(() {
                 but_txt=but_txt2;
               });
                _addSlau();
              },
              child:but_txt,
            ),

          ),
        ],
      ),
    );
  }

}

class AddAnimalMulti extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddAnimalMulti_State();
  }

}
class AddAnimalMulti_State extends State<AddAnimalMulti>{
  static Widget but_txt = but_txt5;
  BuildContext ctx;

  _addAnimalMulti()async{

    String url = 'https://alhabibifarm.secretdevbd.com/API/AddMultipleAnimal';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"male_baby": '+numberOfBabyMaleForMultiAdd +',"male_adult": '+numberOfMaleForMultiAdd+',"female_baby": '+numberOfBabyFemaleForMultiAdd+',"female_adult": '+numberOfFemaleForMultiAdd+',"cat": "'+chooseAnimalForMultiAdd+'","sub_cat": "'+chooseSubAnimalForMultiAdd+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;
    print(statusCode);
    var data=jsonDecode(body);

    setState(() {
      if(data["status"]>0){
        but_txt=but_txt4;
        _showDialog(context,"successfully added");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    ctx=context;
    // TODO: implement build
    return Container(
     child: Column(
       children: <Widget>[
         Container(
           padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

         ),
         Row(
           children: <Widget>[
             Flexible(
                 flex: 1,
                 child: Center(
                   child: Text("Catagory: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                 )
             ),
             Flexible(
                 flex: 1,
                 child:   Center(
                     child:DropdownButton<String>(
                       value:chooseAnimalForMultiAdd ,
                       icon: Icon(Icons.arrow_downward),
                       iconSize: 24,
                       elevation: 16,
                       style: TextStyle(
                           color: Colors.deepPurple
                       ),
                       underline: Container(
                         height: 2,
                         color: Colors.deepPurpleAccent,
                       ),
                       onChanged: (String newValue) {
                         print(newValue);
                         setState(() {
                           chooseAnimalForMultiAdd= newValue;
                           if(newValue=="GOAT"){
                             subAnimalForMultiAdd=goatAnimal;
                             // subAnimalChose=subAnimal[0];
                           }
                           else if(newValue=="HORSE"){
                             subAnimalForMultiAdd=horseAnimal;
                             // subAnimalChose=subAnimal[0];
                           }
                           else if(newValue=="SHEEP"){
                             subAnimalForMultiAdd=sheepAnimal;
                             // subAnimalChose=subAnimal[0];
                           }
                           else{
                             subAnimalForMultiAdd=camelAnimal;
                             // subAnimalChose=subAnimal[0];
                           }
                           chooseSubAnimalForMultiAdd=subAnimalForMultiAdd[0];

                         });
                       },
                       items: aAnimal
                           .map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                         );
                       })
                           .toList(),
                     )
                 )
             )
           ],
         ),
         Container(
           padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

         ),
         Row(
           children: <Widget>[
             Flexible(
                 flex: 1,
                 child: Center(
                   child: Text("Breed: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                 )
             ),
             Flexible(
                 flex: 1,
                 child:   Center(
                     child:DropdownButton<String>(
                       value:chooseSubAnimalForMultiAdd ,
                       icon: Icon(Icons.arrow_downward),
                       iconSize: 24,
                       elevation: 16,
                       style: TextStyle(
                           color: Colors.deepPurple
                       ),
                       underline: Container(
                         height: 2,
                         color: Colors.deepPurpleAccent,
                       ),
                       onChanged: (String newValue) {
                         // print(newValue);
                         setState(() {
                           chooseSubAnimalForMultiAdd = newValue;


                         });
                       },
                       items: subAnimalForMultiAdd
                           .map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                         );
                       })
                           .toList(),
                     )
                 )
             )
           ],
         ),

         Container(
             padding: EdgeInsets.only(left: 20,top: 20, right: 20),

             child: TextField(
               onChanged: (Text) {
                 numberOfMaleForMultiAdd=Text.toString();
               },
               decoration: InputDecoration(
                   prefixIcon: Icon(Icons.verified_user),
                   filled: true,
                   fillColor: Colors.white,
                   border: InputBorder.none,
                   hintText: 'Enter number of Adult male'
               ),
               keyboardType: TextInputType.number,
               inputFormatters: <TextInputFormatter>[
                 WhitelistingTextInputFormatter.digitsOnly
               ],
             )

         ),
         Container(
             padding: EdgeInsets.only(left: 20,top: 20, right: 20),

             child: TextField(
               onChanged: (Text) {
                 numberOfFemaleForMultiAdd=Text.toString();
               },
               decoration: InputDecoration(
                   prefixIcon: Icon(Icons.verified_user),
                   filled: true,
                   fillColor: Colors.white,
                   border: InputBorder.none,
                   hintText: 'Enter number of Adult female'
               ),
               keyboardType: TextInputType.number,
               inputFormatters: <TextInputFormatter>[
                 WhitelistingTextInputFormatter.digitsOnly
               ],
             )

         ),
         Container(
             padding: EdgeInsets.only(left: 20,top: 20, right: 20),

             child: TextField(
               onChanged: (Text) {
                 numberOfBabyMaleForMultiAdd=Text.toString();
               },
               decoration: InputDecoration(
                   prefixIcon: Icon(Icons.verified_user),
                   filled: true,
                   fillColor: Colors.white,
                   border: InputBorder.none,
                   hintText: 'Enter number of baby Male'
               ),
               keyboardType: TextInputType.number,
               inputFormatters: <TextInputFormatter>[
                 WhitelistingTextInputFormatter.digitsOnly
               ],

             )

         ),
         Container(
             padding: EdgeInsets.only(left: 20,top: 20, right: 20),

             child: TextField(
               onChanged: (Text) {
                 numberOfBabyFemaleForMultiAdd=Text.toString();
               },
               decoration: InputDecoration(
                   prefixIcon: Icon(Icons.verified_user),
                   filled: true,
                   fillColor: Colors.white,
                   border: InputBorder.none,
                   hintText: 'Enter number of baby Female'
               ),
               keyboardType: TextInputType.number,
               inputFormatters: <TextInputFormatter>[
                 WhitelistingTextInputFormatter.digitsOnly
               ],

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

               setState(() {
                 but_txt=but_txt2;
               });
               _addAnimalMulti();
             },
             child: but_txt,
           ),

         ),

       ],
     ),
    );
  }

}
///update sttus
class Update_Status extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Update_Status_State();
  }

}
class Update_Status_State extends State<Update_Status>{
  static Widget but_txt = but_txt5;
  _addDied()async{
   // String s=dayChooseforDied+"-"+monthChooseforDied+"-"+yearChooseforDied;
    String url = 'https://alhabibifarm.secretdevbd.com/API/UpdateAnimalStatus';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"AnimalTag": "'+tagChooseForDied+'","Status": "'+chooseAnimalStatus+'"}'; // make POST request
    print(json);
    var response = await http.post(url, headers: headers,
        body: json); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body
    String body = response.body;

    var data=jsonDecode(body);
    print(data["status"]);
    setState(() {
      if(data["status"]==1){
        but_txt=but_txt4;
        _showDialog(context,"Updated Sucessfully");
      }
      else{
        but_txt=but_txt3;
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Tag: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:tagChooseForDied ,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            tagChooseForDied= newValue;

                          });
                        },
                        items: animalTag
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

          ),
          Row(
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                    child: Text("Status: ",style: TextStyle(color:Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  )
              ),
              Flexible(
                  flex: 1,
                  child:   Center(
                      child:DropdownButton<String>(
                        value:chooseAnimalStatus,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          print(newValue);
                          setState(() {
                            chooseAnimalStatus= newValue;

                          });
                        },
                        items: animal_Status
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      )
                  )
              )
            ],
          ),

          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

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
                print(tagChooseForDied);
                print(diedTxt);
                print('$dayChooseforDied - $monthChooseforDied - $yearChooseforDied');
                setState(() {
                  but_txt=but_txt2;
                });
                _addDied();
              },
              child: but_txt,
            ),

          ),
        ],
      ),
    );
  }

}

void _showDialog(BuildContext context,String s) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Notification"),

        content:Container(
          child: Text(s),
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