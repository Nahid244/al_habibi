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
List<String> moreOptionAdmin=["Add Animal","Add Multiple Animal","Add Owner","Add Emplyee","Search","Update Animal","Update Status"];
List<String> moreOptionEmp=["Add Animal","Add Multiple Animal","Search","Update Animal","Update Status"];
List<String> moreOption=["Add Animal","Add Multiple Animal","Add Owner","Add Emplyee","Search","Update Animal","Update Status"];
String chooseMoreOption=moreOption[0];

List<String> subAnimal=goatAnimal;
List<String> subAnimalForMultiAdd=goatAnimal;
String chooseAnimal=aAnimal[0];
String chooseSubAnimal=subAnimal[0];

String chooseAnimalForMultiAdd=aAnimal[0];
String chooseSubAnimalForMultiAdd=subAnimalForMultiAdd[0];

List<String> sex=["Male","Female"];
String chooseSex=sex[0];
String chooseSexForUpdate=sex[0];

List<String> ownerList=[];
String chooseOwner;
String chooseOwnerForUpdate;
String chooseOwnerForMultiAdd;

String numberOfMaleForMultiAdd="0";
String numberOfFemaleForMultiAdd="0";
String numberOfBabyMaleForMultiAdd="0";
String numberOfBabyFemaleForMultiAdd="0";

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

List<String> fatherListGoat=[];
List<String> fatherListSheep=[];
List<String> fatherListHorse=[];
List<String> fatherListCamel=[];
String chooseFather;
String chooseFatherForUpdate;

List<String> animal_Status=["Missing","DIED","SLAUGHTER","Alive"];
String chooseAnimalStatus=animal_Status[0];

List<String> ageListForAdd=["Adult","Baby"];
String chooseAgeForAdd=ageListForAdd[0];

List<String> ageListForUpdate=["Adult","Baby"];
String chooseAgeForUpdate=ageListForAdd[0];

List<String> motherListGoat=[];
List<String> motherListSheep=[];
List<String> motherListHorse=[];
List<String> motherListCamel=[];

String chooseMother;
String chooseMotherForUpdate;

List<String> animalId=[];
String chooseAnimalId;

bool addanimalVisibility=true;
bool addMultianimalVisibility=false;
bool addownerVisibility=false;
bool addempVisibility=false;
bool searchVisibility=false;
bool updateVisibility=false;

bool missingVisibility=false;
bool slaughteredVisibility=false;
bool vaccineVisibility=false;
bool diedVisibility=false;
bool srchResultVisibility=false;
bool updateStatusVisibility=false;
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
int DiedGoatBabyMale=0;
int DiedGoatAdultMale=0;
int DiedGoatBabyFemale=0;
int DiedGoatAdultFemale=0;
int MissingGoat=0;
int MissingGoatBabyMale=0;
int MissingGoatAdultMale=0;
int MissingGoatBabyFemale=0;
int MissingGoatAdultFemale=0;
int SlaughterGoat=0;
int SlaughterGoatBabyMale=0;
int SlaughterGoatAdultMale=0;
int SlaughterGoatBabyFemale=0;
int SlaughterGoatAdultFemale=0;
int AliveGoat=0;
int AliveGoatBabyMale=0;
int AliveGoatAdultMale=0;
int AliveGoatBabyFemale=0;
int AliveGoatAdultFemale=0;
int TotalGoat=0;

int DiedCamel=0;
int DiedCamelBabyMale=0;
int DiedCamelAdultMale=0;
int DiedCamelBabyFemale=0;
int DiedCamelAdultFemale=0;
int MissingCamel=0;
int MissingCamelBabyMale=0;
int MissingCamelAdultMale=0;
int MissingCamelBabyFemale=0;
int MissingCamelAdultFemale=0;
int SlaughterCamel=0;
int SlaughterCamelBabyMale=0;
int SlaughterCamelAdultMale=0;
int SlaughterCamelBabyFemale=0;
int SlaughterCamelAdultFemale=0;
int AliveCamel=0;
int AliveCamelBabyMale=0;
int AliveCamelAdultMale=0;
int AliveCamelBabyFemale=0;
int AliveCamelAdultFemale=0;
int TotalCamel=0;

int DiedHorse=0;
int DiedHorseBabyMale=0;
int DiedHorseAdultMale=0;
int DiedHorseBabyFemale=0;
int DiedHorseAdultFemale=0;
int MissingHorse=0;
int MissingHorseBabyMale=0;
int MissingHorseAdultMale=0;
int MissingHorseBabyFemale=0;
int MissingHorseAdultFemale=0;
int SlaughterHorse=0;
int SlaughterHorseBabyMale=0;
int SlaughterHorseAdultMale=0;
int SlaughterHorseBabyFemale=0;
int SlaughterHorseAdultFemale=0;
int AliveHorse=0;
int AliveHorseBabyMale=0;
int AliveHorseAdultMale=0;
int AliveHorseBabyFemale=0;
int AliveHorseAdultFemale=0;
int TotalHorse=0;

int DiedSheep=0;
int DiedSheepBabyMale=0;
int DiedSheepAdultMale=0;
int DiedSheepBabyFemale=0;
int DiedSheepAdultFemale=0;
int MissingSheep=0;
int MissingSheepBabyMale=0;
int MissingSheepAdultMale=0;
int MissingSheepBabyFemale=0;
int MissingSheepAdultFemale=0;
int SlaughterSheep=0;
int SlaughterSheepBabyMale=0;
int SlaughterSheepAdultMale=0;
int SlaughterSheepBabyFemale=0;
int SlaughterSheepAdultFemale=0;
int AliveSheep=0;
int AliveSheepBabyMale=0;
int AliveSheepAdultMale=0;
int AliveSheepBabyFemale=0;
int AliveSheepAdultFemale=0;
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
 String age;



 Anim(this.AddedDate, this.AnimalBreed, this.AnimalCategory,
      this.AnimalID,  this.AnimalPictureName,
     this.AnimalSex, this.AnimalStatus,this.age,
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


