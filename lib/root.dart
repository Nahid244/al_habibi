import 'dart:convert';

import 'package:al_habibi/animal.dart';
import 'package:al_habibi/home.dart';
import 'package:al_habibi/more.dart';
import 'package:al_habibi/publicdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Root extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Root_state();
  }

}
class Root_state extends State<Root>{
 // static Animal Sheep=;
// static Animal Goat=;

// static Animal Horse=;
// static Animal Camel=;



  List<Widget> Bottom_nav_stat_list=[Home(),new Animal(sheepAnimal.length,sheepAnimal,"sheep",listOfSheep),new Animal(goatAnimal.length,goatAnimal,"Goat",listOfGoat),new Animal(horseAnimal.length,horseAnimal,"Horse",listOfHorse),new Animal(camelAnimal.length,camelAnimal,"Camel",listOfCamel),More()];



  int bottom_nav_selectedIdx=0;

  void _onItemTapped(int index){
    setState(() {
      bottom_nav_selectedIdx=index;

    });
  }


  _getNoOfAnimals()async{
    noOfGoats=0;
    noOfSheeps=0;
    noOfHorse=0;
    noOfCamel=0;

    listOfGoat.clear();
    listofGoatsNgoat.clear();
    listofGoatsShammal.clear();
    listofGoatsOmani.clear();
    ownerList.clear();

    listOfHorse.clear();
    listofHorseBeauty.clear();
    listofHorseRacing.clear();
    ///camel
    listOfCamel.clear();
    listofCamelBig.clear();
    listofCamelSmall.clear();
    ///shhep
    listOfSheep.clear();
    listofSheepTallal.clear();
    listofSheepSimon.clear();
    listofSheepSaleh.clear();
    listofSheepRobby.clear();
    listofSheepBarbi.clear();
    listofSheepHarrayat.clear();

    String urll = 'https://alhabibifarm.secretdevbd.com/API/AllAnimals';
   // String url = 'https://alhabibifarm.secretdevbd.com/API/AnimalsByCategory';
    String url2='https://alhabibifarm.secretdevbd.com/API/AllOwner';
    String url3='https://alhabibifarm.secretdevbd.com/API/CommonData';
    String url4='https://alhabibifarm.secretdevbd.com/API/AllVaccineHistory';
    Map<String, String> headers = {"Content-type": "application/json"};
//    String json = '{"category": "GOAT"}';
//    String json1 = '{"category": "HORSE"}';
//    String json2 = '{"category": "SHEEP"}';
//    String json3 = '{"category": "CAMEL"}';

    var res = await http.post(urll, headers: headers);




//    var response1 = await http.post(url, headers: headers, body: json1);
//    var response2 = await http.post(url, headers: headers, body: json2);
//    var response3 = await http.post(url, headers: headers, body: json3);// check the status code for the result
    var response4 = await http.post(url2, headers: headers);
    var response5 = await http.post(url3, headers: headers);
//    int statusCode = response
//        .statusCode; // this API passes back the id of the new item added to the body
//    String body = response.body;
//    String body1 = response1.body;
//    String body2 = response2.body;
//    String body3 = response3.body;


    var data=jsonDecode(res.body) ;
    print(data);
//    var data1=jsonDecode(body1) ;
//    var data2=jsonDecode(body2) ;
//    var data3=jsonDecode(body3) ;
    var data4=jsonDecode(response4.body) ;
    var data5=jsonDecode(response5.body) ;

    DiedGoat=data5["data"]["DiedGoat"];
     MissingGoat=data5["data"]["MissingGoat"];
     SlaughterGoat=data5["data"]["SlaughterGoat"];
     TotalGoat=data5["data"]["TotalGoat"];

   DiedCamel=data5["data"]["DiedCamel"];
    MissingCamel=data5["data"]["MissingCamel"];
    SlaughterCamel=data5["data"]["SlaughterCamel"];
    TotalCamel=data5["data"]["TotalCamel"];

     DiedHorse=data5["data"]["DiedHorse"];
    MissingHorse=data5["data"]["MissingHorse"];
     SlaughterHorse=data5["data"]["SlaughterHorse"];
     TotalHorse=data5["data"]["TotalHorse"];

     DiedSheep=data5["data"]["DiedSheep"];
     MissingSheep=data5["data"]["MissingSheep"];
     SlaughterSheep=data5["data"]["SlaughterSheep"];
     TotalSheep=data5["data"]["TotalSheep"];

//     int d=data5["data"]["MissingCamel"];
//     print("sddddd $data5");
    for(var i in data4["data"]){
      ownerList.add(i["OwnerName"]);
    }
    for(var i in data["data"]){
      animalTag.add(i["AnimalTag"]);
      animalId.add(i["AnimalTag"]);
      if(i["AnimalSex"]=="Male"){
        fatherList.add(i["AnimalTag"]);
      }
      else{
        motherList.add(i["AnimalTag"]);
      }
      if(!ownerList.contains(i["AnimalOwner"])){
        ownerList.add(i["AnimalOwner"]);
      }
      if(i["AnimalCategory"]=="GOAT"){
        if(i["AnimalBreed"]=="OMANI"){
        listofGoatsOmani.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SHAMMAL"){


        listofGoatsShammal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));

      }
      else{

        listofGoatsNgoat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      noOfGoats++;
      }
      else if(i["AnimalCategory"]=="HORSE"){
        if(i["AnimalBreed"]=="BEAUTY"){
        listofHorseBeauty.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else {
        listofHorseRacing.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      noOfHorse++;

      }
      else if(i["AnimalCategory"]=="SHEEP"){
        if(i["AnimalBreed"]=="TALLAL"){
        listofSheepTallal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SIMON"){
        listofSheepSimon.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SALEH"){
        listofSheepSaleh.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="ROBBY"){
        listofSheepRobby.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="HARRYAT"){
        listofSheepHarrayat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else{
        listofSheepBarbi.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }

      noOfSheeps++;
      }
      else{
        if(i["AnimalBreed"]=="BIG"){
        listofCamelBig.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else {
        listofCamelSmall.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      noOfCamel++;
      }
    }

//    for(var i in data["data"]){
//      animalTag.add(i["AnimalTag"]);
//      animalId.add(i["AnimalTag"]);
//      if(i["AnimalSex"]=="Male"){
//        fatherList.add(i["AnimalTag"]);
//      }
//      else{
//        motherList.add(i["AnimalTag"]);
//      }
//      if(!ownerList.contains(i["AnimalOwner"])){
//        ownerList.add(i["AnimalOwner"]);
//      }
//      if(i["AnimalBreed"]=="OMANI"){
//        listofGoatsOmani.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else if(i["AnimalBreed"]=="SHAMMAL"){
//
//
//        listofGoatsShammal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//
//      }
//      else{
//
//        listofGoatsNgoat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      noOfGoats++;
//    }
//    for(var i in data1["data"]){
//      animalTag.add(i["AnimalTag"]);
//      animalId.add(i["AnimalTag"]);
//      if(i["AnimalSex"]=="Male"){
//        fatherList.add(i["AnimalTag"]);
//      }
//      else{
//        motherList.add(i["AnimalTag"]);
//      }
//      if(!ownerList.contains(i["AnimalOwner"])){
//        ownerList.add(i["AnimalOwner"]);
//      }
//      if(i["AnimalBreed"]=="BEAUTY"){
//        listofHorseBeauty.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else {
//        listofHorseRacing.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      noOfHorse++;
//    }
//    for(var i in data2["data"]){
//      animalTag.add(i["AnimalTag"]);
//      animalId.add(i["AnimalTag"]);
//      if(i["AnimalSex"]=="Male"){
//        fatherList.add(i["AnimalTag"]);
//      }
//      else{
//        motherList.add(i["AnimalTag"]);
//      }
//      if(!ownerList.contains(i["AnimalOwner"])){
//        ownerList.add(i["AnimalOwner"]);
//      }
//      if(i["AnimalBreed"]=="TALLAL"){
//        listofSheepTallal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else if(i["AnimalBreed"]=="SIMON"){
//        listofSheepSimon.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else if(i["AnimalBreed"]=="SALEH"){
//        listofSheepSaleh.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else if(i["AnimalBreed"]=="ROBBY"){
//        listofSheepRobby.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else if(i["AnimalBreed"]=="HARRYAT"){
//        listofSheepHarrayat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else{
//        listofSheepBarbi.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//
//      noOfSheeps++;
//    }
//    for(var i in data3["data"]){
//      animalTag.add(i["AnimalTag"]);
//      animalId.add(i["AnimalTag"]);
//      if(i["AnimalSex"]=="Male"){
//        fatherList.add(i["AnimalTag"]);
//      }
//      else{
//        motherList.add(i["AnimalTag"]);
//      }
//      if(!ownerList.contains(i["AnimalOwner"])){
//        ownerList.add(i["AnimalOwner"]);
//      }
//      if(i["AnimalBreed"]=="BIG"){
//        listofCamelBig.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      else {
//        listofCamelSmall.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalDOB"]),IfNull(i["AnimalFather"]),IfNull(i["AnimalID"]),IfNull(i["AnimalMother"]),IfNull(i["AnimalOwner"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalStatusCause"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
//      }
//      noOfCamel++;
//    }
    listOfGoat.add(listofGoatsOmani);
    listOfGoat.add(listofGoatsShammal);
    listOfGoat.add(listofGoatsNgoat);

    listOfHorse.add(listofHorseBeauty);
    listOfHorse.add(listofHorseRacing);

    listOfCamel.add(listofCamelBig);
    listOfCamel.add(listofCamelSmall);

    listOfSheep.add(listofSheepTallal);
    listOfSheep.add(listofSheepSimon);
    listOfSheep.add(listofSheepSaleh);
    listOfSheep.add(listofSheepRobby);
    listOfSheep.add(listofSheepBarbi);
    listOfSheep.add(listofSheepHarrayat);

  //  if(ownerList.isEmpty){
      ownerList.add("None");
     // ownerList.add("empty2");
  //  }
   // if(fatherList.isEmpty){
      fatherList.add("None");
     // fatherList.add("empty2");
  //  }
   // if(motherList.isEmpty){
      motherList.add("None");
    //  motherList.add("empty2");
   // }
  //  if(animalTag.isEmpty){
      animalTag.add("None");
     // animalTag.add("empty2");
   // }
   // if(animalId.isEmpty){
      animalId.add("None");
     // animalId.add("empty2");
   // }

    chooseOwner=ownerList[0];
    chooseOwnerForMultiAdd=ownerList[0];
    chooseFather=fatherList[0];
    chooseMother=motherList[0];
    chooseAnimalId=animalId[0];

    chooseOwnerForUpdate=ownerList[0];
    chooseFatherForUpdate=fatherList[0];
    chooseMotherForUpdate=motherList[0];

    tagChooseForVcc=animalTag[0];
    tagChooseForDied=animalTag[0];
    tagChooseForMiss=animalTag[0];
    tagChooseForSlau=animalTag[0];

    addanimalVisibility=true;
    addownerVisibility=false;
    addempVisibility=false;
    searchVisibility=false;
    updateVisibility=false;
    missingVisibility=false;
    slaughteredVisibility=false;
    vaccineVisibility=false;
    diedVisibility=false;
    srchResultVisibility=false;
    print("yesss111");

//    for(var i in animalTag){
//      String json4 = '{"AnimalTag": "'+i+'"}';
      var response6 = await http.post(url4, headers: headers);
      //var bod=response6.body;
      var dat=jsonDecode(response6.body);
      print(response6.body);
      for(var j in dat["data"]) {
        vccDetails.add(VccDetails(
            IfNull(j["AnimalTag"]), IfNull(j["VDate"]), IfNull(j["VDetails"]),
            j["VID"]));
      }
//      }
//    }
    print("yesss");

    setState(() {
      loadedCountData=true;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(loadedCountData==false){
      _getNoOfAnimals();
      print("i am in");
      return
             WillPopScope(
                 child: Scaffold(
                   backgroundColor: Colors.white,
                   body:  Container(
                     color: Colors.white,
                     child: Center(
                       child: CircularProgressIndicator(),
                     ),
                   ),
                 )
                 , onWillPop:  () async => false
             );


    }
    else{
      return
             WillPopScope(
                 child: Scaffold(

                   body: Bottom_nav_stat_list.elementAt(bottom_nav_selectedIdx),
                   bottomNavigationBar: BottomNavigationBar(
                     backgroundColor:Color.fromRGBO(88,161,69,1),
                     unselectedItemColor: Color.fromRGBO(228,163,35,1),
                     type: BottomNavigationBarType.fixed,
                     selectedItemColor:Colors.white,
                     items: const <BottomNavigationBarItem>[

                       BottomNavigationBarItem(

                           icon: Icon(Icons.home),
                           title: Text("Home")
                       ),
                       BottomNavigationBarItem(
                           icon: Icon(Icons.adjust),
                           title: Text("Sheep")
                       ),
                       BottomNavigationBarItem(

                           icon: Icon(Icons.adjust),
                           title: Text("Goat")
                       ),
                       BottomNavigationBarItem(
                           icon: Icon(Icons.adjust),
                           title: Text("Horse")
                       ),
                       BottomNavigationBarItem(
                           icon: Icon(Icons.adjust),
                           title: Text("Camel")
                       ),
                       BottomNavigationBarItem(
                           icon: Icon(Icons.more),
                           title: Text("More")
                       ),


                     ],
                     currentIndex: bottom_nav_selectedIdx,

                     onTap: _onItemTapped,
                   ),

                 ),
                 onWillPop:  () async => false
             );






    }
  }

}

