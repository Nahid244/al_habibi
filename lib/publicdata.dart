import 'package:flutter/material.dart';

String logGmail;
String logPass;

String loginType;
String loginName;

int noOfGoats;
int noOfSheeps;
int noOfHorse;
int noOfCamel;
bool loadedCountData=false;
bool loadedLoginData=false;
///goat
List<List<Anim>> listOfGoat=[];
List<Anim> listofGoatsShammal=[];
List<Anim> listofGoatsOmani=[];
List<Anim> listofGoatsNgoat=[];
////horse
List<List<Anim>> listOfHorse=[];
List<Anim> listofHorseBeauty=[];
List<Anim> listofHorseRacing=[];
///camel
List<List<Anim>> listOfCamel=[];
List<Anim> listofCamelBig=[];
List<Anim> listofCamelSmall=[];
///shhep
List<List<Anim>> listOfSheep=[];
List<Anim> listofSheepTallal=[];
List<Anim> listofSheepSimon=[];
List<Anim> listofSheepSaleh=[];
List<Anim> listofSheepRobby=[];
List<Anim> listofSheepBarbi=[];
List<Anim> listofSheepHarrayat=[];

List<String> aAnimal=["GOAT","HORSE","SHEEP","CAMEL"];
List<String> camelAnimal=['BIG','SMALL'];
List<String> goatAnimal=["OMANI","SHAMMAL","NORMAL GOAT"];
List<String> sheepAnimal=['TALLAL','SIMON','SALEH','ROBBY','BARBI','HARRYAT'];
List<String> horseAnimal=['BEAUTY','RACING'];

///vccDEt
List<VccDetails> vccDetails=[];


///more
List<String> moreOptionAdmin=["Add animal","Add Owner","Add emplyee","Search","Update","Missing","Slaugtered","Died","Vaccine"];
List<String> moreOptionEmp=["Add animal","Search","Update","Missing","Slaugtered","Died","Vaccine"];
List<String> moreOption=["Add animal","Add Owner","Add emplyee","Search","Update","Missing","Slaugtered","Died","Vaccine"];
String chooseMoreOption=moreOption[0];

List<String> subAnimal=goatAnimal;
String chooseAnimal=aAnimal[0];
String chooseSubAnimal=subAnimal[0];

List<String> sex=["Male","Female"];
String chooseSex=sex[0];
String chooseSexForUpdate=sex[0];

List<String> ownerList=[];
String chooseOwner;
String chooseOwnerForUpdate;

List<Anim> srchData=[];

List<String> monthList=["1","2","3","4","5","6","7","8","9","10","11","12"];
List<String> dayList=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];
List<String> yearList=["2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2024",
"2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2046","2046","2047","2048","2049","2050"];
String monthChooseforAddAnimal=monthList[0];
String dayChooseforAddAnimal=dayList[0];
String yearChooseforAddAnimal=yearList[0];

String monthChooseforUpdate=monthList[0];
String dayChooseforUpdate=dayList[0];
String yearChooseforUpdate=yearList[0];

String monthChooseforMissing=monthList[0];
String dayChooseforMissing=dayList[0];
String yearChooseforMissing=yearList[0];

String monthChooseforSlau=monthList[0];
String dayChooseforSlau=dayList[0];
String yearChooseforSlau=yearList[0];

String monthChooseforDied=monthList[0];
String dayChooseforDied=dayList[0];
String yearChooseforDied=yearList[0];

String monthChooseforVcc=monthList[0];
String dayChooseforVcc=dayList[0];
String yearChooseforVcc=yearList[0];

List<String> fatherList=[];
String chooseFather;
String chooseFatherForUpdate;
List<String> motherList=[];
String chooseMother;
String chooseMotherForUpdate;

List<String> animalId=[];
String chooseAnimalId;

bool addanimalVisibility=true;
bool addownerVisibility=false;
bool addempVisibility=false;
bool searchVisibility=false;
bool updateVisibility=false;

bool missingVisibility=false;
bool slaughteredVisibility=false;
bool vaccineVisibility=false;
bool diedVisibility=false;
bool srchResultVisibility=false;

bool alertVisibility=false;

String searchTxt;
String ownerNameTxt;

String empNameTxt;
String empPhnTxt;
String empMailTxt;
String empAddTxt;
String empPassTxt;

List<String> animalTag=[];
String tagChooseForMiss;
String tagChooseForSlau;
String tagChooseForVcc;
String tagChooseForDied;


String diedTxt;
String vccTxt;

String choosePicForAdd;
String choosePicForupdate;

 Widget but_txt1 = Text("login");
 Widget but_txt2 = CircularProgressIndicator();
 Widget but_txt3 =Text("try agian",style: TextStyle(color: Colors.red),);
Widget but_txt4 =Text("try another");
Widget but_txt5 =Text("Add");
Widget but_txt6 =Text("Search");
Widget but_txt7=Text("update");


int DiedGoat=0;
int MissingGoat=0;
int SlaughterGoat=0;
int TotalGoat=0;

int DiedCamel=0;
int MissingCamel=0;
int SlaughterCamel=0;
int TotalCamel=0;

int DiedHorse=0;
int MissingHorse=0;
int SlaughterHorse=0;
int TotalHorse=0;

int DiedSheep=0;
int MissingSheep=0;
int SlaughterSheep=0;
int TotalSheep=0;

class Anim{
 String AddedDate;
 String AnimalBreed;
 String AnimalCategory;
 String AnimalDOB;
 String AnimalFather;
 String AnimalID;
 String AnimalMother;
 String AnimalOwner;
 String AnimalPictureName;
 String AnimalSex;
 String AnimalStatus;
 String AnimalStatusCause;
 String AnimalStatusDate;
 String AnimalTag;
// String AnimalWeight;
 String UpdatedDate;



 Anim(this.AddedDate, this.AnimalBreed, this.AnimalCategory, this.AnimalDOB,
     this.AnimalFather, this.AnimalID, this.AnimalMother, this.AnimalOwner,this.AnimalPictureName,
     this.AnimalSex, this.AnimalStatus, this.AnimalStatusCause,
     this.AnimalStatusDate, this.AnimalTag,
     this.UpdatedDate);




}
String IfNull(var value) {
 if (value == null) {
  return "";
 }
 else{
  return value.toString();
 }
}
class VccDetails{
 String AnimalTag;
 String VDate;
 String VDetails;
 int VID;

 VccDetails(this.AnimalTag, this.VDate, this.VDetails, this.VID);



}
//int idx(String tag){
// int id;
// for(int i=0;i<vccDetails.length;i++){
//  if(vccDetails[i].AnimalTag==tag){
//   id=i;
//   break;
//  }
// }
// return id;
//
//}


