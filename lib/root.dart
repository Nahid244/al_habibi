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

    fatherListGoat.clear();
    fatherListSheep.clear();
    fatherListHorse.clear();
    fatherListCamel.clear();

    motherListGoat.clear();
    motherListSheep.clear();
    motherListHorse.clear();
    motherListCamel.clear();

    ownerList.add("None");
    fatherListGoat.add("None");
    fatherListSheep.add("None");
    fatherListHorse.add("None");
    fatherListCamel.add("None");

    motherListGoat.add("None");
    motherListSheep.add("None");
    motherListHorse.add("None");
    motherListCamel.add("None");


     animalTagForUpdateOmani.clear();
     animalTagForUpdateShammal.clear();
     animalTagForUpdateNg.clear();

    animalTagForUpdateTallal.clear();
     animalTagForUpdateSimon.clear();
     animalTagForUpdateSaleh.clear();
     animalTagForUpdateRobbi.clear();
     animalTagForUpdateBarbi.clear();
    animalTagForUpdateHarrayat.clear();
     animalTagForUpdateProject.clear();

    animalTagForUpdateBeauty.clear();
     animalTagForUpdateRacing.clear();

     animalTagForUpdateBig.clear();
     animalTagForUpdateSmall.clear();

    String urll = 'https://alhabibifarm.secretdevbd.com/API/AllAnimals';
   // String url = 'https://alhabibifarm.secretdevbd.com/API/AnimalsByCategory';
    String url2='https://alhabibifarm.secretdevbd.com/API/AllOwner';
    //String url3='https://alhabibifarm.secretdevbd.com/API/CommonData';
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
  //  var response5 = await http.post(url3, headers: headers);
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
  //  var data5=jsonDecode(response5.body) ;

//    DiedGoat=data5["data"]["DiedGoat"];
//     MissingGoat=data5["data"]["MissingGoat"];
//     SlaughterGoat=data5["data"]["SlaughterGoat"];
//     TotalGoat=data5["data"]["TotalGoat"];
//
//   DiedCamel=data5["data"]["DiedCamel"];
//    MissingCamel=data5["data"]["MissingCamel"];
//    SlaughterCamel=data5["data"]["SlaughterCamel"];
//    TotalCamel=data5["data"]["TotalCamel"];
//
//     DiedHorse=data5["data"]["DiedHorse"];
//    MissingHorse=data5["data"]["MissingHorse"];
//     SlaughterHorse=data5["data"]["SlaughterHorse"];
//     TotalHorse=data5["data"]["TotalHorse"];
//
//     DiedSheep=data5["data"]["DiedSheep"];
//     MissingSheep=data5["data"]["MissingSheep"];
//     SlaughterSheep=data5["data"]["SlaughterSheep"];
//     TotalSheep=data5["data"]["TotalSheep"];

//     int d=data5["data"]["MissingCamel"];
//     print("sddddd $data5");
    for(var i in data4["data"]){
      ownerList.add(i["OwnerName"]);
    }
    for(var i in data["data"]){
      animalTag.add(i["AnimalTag"]);
      animalId.add(i["AnimalTag"]);
      print("Tag");
      print(i["AnimalTag"]);
      if(!ownerList.contains(i["AnimalOwner"])){
        ownerList.add(i["AnimalOwner"]);
      }
      if(i["AnimalCategory"]=="GOAT"){
        TotalGoat++;

        if(i["AnimalStatus"]=="ALIVE"){
          AliveGoat++;
             if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
               AliveGoatBabyMale++;
             }
             else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
               AliveGoatBabyFemale++;
             }
             else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
               AliveGoatAdultMale++;
             }
             else{
               AliveGoatAdultFemale++;
             }
        }
        else if(i["AnimalStatus"]=="SLAUGHTER"){
          SlaughterGoat++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            SlaughterGoatBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            SlaughterGoatBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            SlaughterGoatAdultMale++;
          }
          else{
            SlaughterGoatAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="MISSING"){
          MissingGoat++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            MissingGoatBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            MissingGoatBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            MissingGoatAdultMale++;
          }
          else{
            MissingGoatAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="DIED"){
          DiedGoat++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            DiedGoatBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            DiedGoatBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            DiedGoatAdultMale++;
          }
          else{
            DiedGoatAdultFemale++;
          }

        }





        if(i["AnimalBreed"]=="OMANI"){
          animalTagForUpdateOmani.add(i["AnimalTag"]);
        listofGoatsOmani.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SHAMMAL"){

          animalTagForUpdateShammal.add(i["AnimalTag"]);

        listofGoatsShammal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));

      }
      else{
          animalTagForUpdateNg.add(i["AnimalTag"]);
        listofGoatsNgoat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
        if(i["AnimalSex"]=="Male"){
          fatherListGoat.add(i["AnimalTag"]);
        }
        else{
          motherListGoat.add(i["AnimalTag"]);
        }
      noOfGoats++;
      }
      else if(i["AnimalCategory"]=="HORSE"){


        TotalHorse++;

        if(i["AnimalStatus"]=="ALIVE"){
          AliveHorse++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            AliveHorseBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            AliveHorseBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            AliveHorseAdultMale++;
          }
          else{
            AliveHorseAdultFemale++;
          }
        }
        else if(i["AnimalStatus"]=="SLAUGHTER"){
          SlaughterHorse++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            SlaughterHorseBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            SlaughterHorseBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            SlaughterHorseAdultMale++;
          }
          else{
            SlaughterHorseAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="MISSING"){
          MissingHorse++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            MissingHorseBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            MissingHorseBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            MissingHorseAdultMale++;
          }
          else{
            MissingHorseAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="DIED"){
          DiedHorse++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            DiedHorseBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            DiedHorseBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            DiedHorseAdultMale++;
          }
          else{
            DiedHorseAdultFemale++;
          }

        }





        if(i["AnimalBreed"]=="BEAUTY"){
          animalTagForUpdateBeauty.add(i["AnimalTag"]);
        listofHorseBeauty.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else {
          animalTagForUpdateRacing.add(i["AnimalTag"]);
        listofHorseRacing.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
        if(i["AnimalSex"]=="Male"){
          fatherListHorse.add(i["AnimalTag"]);
        }
        else{
          motherListHorse.add(i["AnimalTag"]);
        }
      noOfHorse++;

      }
      else if(i["AnimalCategory"]=="SHEEP"){


        TotalSheep++;

        if(i["AnimalStatus"]=="ALIVE"){
          AliveSheep++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            AliveSheepBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            AliveSheepBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            AliveSheepAdultMale++;
          }
          else{
            AliveSheepAdultFemale++;
          }
        }
        else if(i["AnimalStatus"]=="SLAUGHTER"){
          SlaughterSheep++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            SlaughterSheepBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            SlaughterSheepBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            SlaughterSheepAdultMale++;
          }
          else{
            SlaughterSheepAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="MISSING"){
          MissingSheep++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            MissingSheepBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            MissingSheepBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            MissingSheepAdultMale++;
          }
          else{
            MissingSheepAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="DIED"){
          DiedSheep++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            DiedSheepBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            DiedSheepBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            DiedSheepAdultMale++;
          }
          else{
            DiedSheepAdultFemale++;
          }

        }



        if(i["AnimalBreed"]=="TALLAL"){
          animalTagForUpdateTallal.add(i["AnimalTag"]);
        listofSheepTallal.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SIMON"){
          animalTagForUpdateSimon.add(i["AnimalTag"]);
        listofSheepSimon.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="SALEH"){
          animalTagForUpdateSaleh.add(i["AnimalTag"]);
        listofSheepSaleh.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="ROBBY"){
          animalTagForUpdateRobbi.add(i["AnimalTag"]);
        listofSheepRobby.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else if(i["AnimalBreed"]=="HARRYAT"){
          animalTagForUpdateHarrayat.add(i["AnimalTag"]);
        listofSheepHarrayat.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
        else if(i["AnimalBreed"]=="PROJECT"){
          animalTagForUpdateProject.add(i["AnimalTag"]);
          listofSheepProject.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
        }
      else{
          animalTagForUpdateBarbi.add(i["AnimalTag"]);
        listofSheepBarbi.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
        if(i["AnimalSex"]=="Male"){
          fatherListSheep.add(i["AnimalTag"]);
        }
        else{
          motherListSheep.add(i["AnimalTag"]);
        }

      noOfSheeps++;
      }
      else{

        TotalCamel++;

        if(i["AnimalStatus"]=="ALIVE"){
          AliveCamel++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            AliveCamelBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            AliveCamelBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            AliveCamelAdultMale++;
          }
          else{
            AliveCamelAdultFemale++;
          }
        }
        else if(i["AnimalStatus"]=="SLAUGHTER"){
          SlaughterCamel++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            SlaughterCamelBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            SlaughterCamelBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            SlaughterCamelAdultMale++;
          }
          else{
            SlaughterCamelAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="MISSING"){
          MissingCamel++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            MissingCamelBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            MissingCamelBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            MissingCamelAdultMale++;
          }
          else{
            MissingCamelAdultFemale++;
          }

        }
        else if(i["AnimalStatus"]=="DIED"){
          DiedCamel++;
          if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Baby"){
            DiedCamelBabyMale++;
          }
          else if(i["AnimalSex"]=="Female" && i["AnimalAge"]=="Baby"){
            DiedCamelBabyFemale++;
          }
          else if(i["AnimalSex"]=="Male" && i["AnimalAge"]=="Adult"){
            DiedCamelAdultMale++;
          }
          else{
            DiedCamelAdultFemale++;
          }

        }


        if(i["AnimalBreed"]=="BIG"){
          animalTagForUpdateBig.add(i["AnimalTag"]);
        listofCamelBig.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
      else {
          animalTagForUpdateSmall.add(i["AnimalTag"]);
        listofCamelSmall.add(Anim(IfNull(i["AddedDate"]),IfNull(i["AnimalBreed"]),IfNull(i["AnimalCategory"]),IfNull(i["AnimalID"]),IfNull(i["AnimalPictureName"]),IfNull(i["AnimalSex"]),IfNull(i["AnimalStatus"]),IfNull(i["AnimalAge"]),IfNull(i["AnimalStatusDate"]),IfNull(i["AnimalTag"]),IfNull(i["UpdatedDate"])));
      }
        if(i["AnimalSex"]=="Male"){
          fatherListCamel.add(i["AnimalTag"]);
        }
        else{
          motherListCamel.add(i["AnimalTag"]);
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
    listOfSheep.add(listofSheepProject);


    animalTagForUpdateOmani.add("Empty Omani");
    animalTagForUpdateShammal.add("Empty Shammal");
    animalTagForUpdateNg.add("Empty Normal Goat");

    animalTagForUpdateTallal.add("Empty Tallal");
    animalTagForUpdateSimon.add("Empty Simon");
    animalTagForUpdateSaleh.add("Empty Saleh");
    animalTagForUpdateRobbi.add("Empty Robbi");
    animalTagForUpdateBarbi.add("Empty Barbi");
    animalTagForUpdateHarrayat.add("Empty Harrayat");
    animalTagForUpdateProject.add("Empty Project");

    animalTagForUpdateBig.add("Empty Big");
    animalTagForUpdateSmall.add("Empty Small");

    animalTagForUpdateBeauty.add("Empty Beauty");
    animalTagForUpdateRacing.add("Empty Racing");

//    print(animalTagForUpdateOmani);
//    print(animalTagForUpdateShammal);
//    print(animalTagForUpdateNg);
//
//    print(animalTagForUpdateTallal);
//    print(animalTagForUpdateSimon);
//    print(animalTagForUpdateSaleh);
//    print(animalTagForUpdateRobbi);
//    print(animalTagForUpdateBarbi);
//    print(animalTagForUpdateProject);
//
//    print(animalTagForUpdateBeauty);
//    print(animalTagForUpdateRacing);
//
//    print(animalTagForUpdateBig);
//    print(animalTagForUpdateSmall);

//    animalTagForUpdateOmani.add("None1");
//    animalTagForUpdateShammal.add("None1");
//    animalTagForUpdateNg.add("None1");
//
//    animalTagForUpdateTallal.add("None1");
//    animalTagForUpdateSimon.add("None1");
//    animalTagForUpdateSaleh.add("None1");
//    animalTagForUpdateRobbi.add("None1");
//    animalTagForUpdateBarbi.add("None1");
//    animalTagForUpdateHarrayat.add("None1");
//    animalTagForUpdateProject.add("None1");
//
//    animalTagForUpdateBig.add("None1");
//    animalTagForUpdateSmall.add("None1");
//
//    animalTagForUpdateBeauty.add("None1");
//    animalTagForUpdateRacing.add("None1");
    animalTagForUpdate=animalTagForUpdateOmani;

//    print(animalTagForUpdateOmani);
//    print(animalTagForUpdateShammal);
//    print(animalTagForUpdateNg);
  //  if(ownerList.isEmpty){

     // ownerList.add("empty2");
  //  }
   // if(fatherList.isEmpty){

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
    chooseFather=fatherListGoat[0];
    chooseMother=motherListGoat[0];
    chooseAnimalId=animalTagForUpdateOmani[0];

    chooseOwnerForUpdate=ownerList[0];
    chooseFatherForUpdate=fatherListGoat[0];
    chooseMotherForUpdate=motherListGoat[0];

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

