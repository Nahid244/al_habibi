import 'package:flutter/material.dart';
import 'package:al_habibi/publicdata.dart';

//class Animal extends StatefulWidget{
//  int subCatLength;
//  List<String> subCat;
//  String title;
//
//  Animal(int subCatLength,List<String> subCat,String title){
//    this.subCatLength=subCatLength;
//    this.subCat=subCat;
//    this.title=title;
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return Animal_State(subCatLength,subCat,title);
//  }
//
//}
class Animal extends StatelessWidget{
  int subCatLength;
  List<String> subCat;
  String title;
  bool scrolable;
  List<List<Anim>> subCatList=[];

  Animal(int subCatLength,List<String> subCat,String title,List<List<Anim>> subCatList){
    this.subCatLength=subCatLength;
    this.subCat=subCat;
    this.title=title;
    this.subCatList=subCatList;
    if(subCatLength>=5){
      scrolable=true;
    }
    else{
      scrolable=false;

    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: subCatLength,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(88,161,69,1),
            title: Text(title),
            bottom: PreferredSize(

                child: Container(
                  color: Color.fromRGBO(186,217,114,1),
                  child: TabBar(
                      isScrollable: scrolable,

                      unselectedLabelColor: Color.fromRGBO(228,163,35,1),
                      indicatorColor: Colors.white,
                      tabs: List.generate(subCat.length,(index){
    return Tab(
    child: Text(subCat[index]),
    );
    }
                  ),
                  )
                ),
                preferredSize: Size.fromHeight(70.0)),

          ),
          body:
          TabBarView(
            children: List.generate(subCat.length,(idx){

                 return Container(

                    decoration: BoxDecoration(color:Color.fromRGBO(30,37,43,1)),
                   child: Center(
                      child:Container(
                        child: SingleChildScrollView(
                          child: Column(

                             children: List.generate(subCatList[idx].length,(index){

                               List<VccDetails> vccDet=[];
                               for(var i in vccDetails){
                                 if(i.AnimalTag==subCatList[idx][index].AnimalTag){
                                   vccDet.add(i);
                                 }
                               }

                              return Card(
                              child: Column(
                              children: <Widget>[
//              ListTile(
//              // leading: Icon(Icons.album),
//              title: Text(),
//              subtitle: Text(subCatList[idx][index].AnimalBreed),
//              ),

              ExpansionTile(
              title:  Text(subCatList[idx][index].AnimalTag, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              children: <Widget>[
              Image.network(
              'https://alhabibifarm.secretdevbd.com/static/UPLOADS/'+subCatList[idx][index].AnimalPictureName,
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

                        Text("Animal Age",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                        Text("Animal Sex",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                        Text("Animal Status",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                        Text("Animal StatusDate",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                        Text("Updated Date",textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

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


                      ],
                    )
                  ),
                  Center(
                      child: Column(
                        children: <Widget>[
                          Text(subCatList[idx][index].AddedDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].AnimalBreed,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].AnimalCategory,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].age,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                         // Text(subCatList[idx][index].AnimalFather,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          //Text(subCatList[idx][index].AnimalMother,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                         // Text(subCatList[idx][index].AnimalID,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          //Text(subCatList[idx][index].AnimalOwner,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].AnimalSex,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].AnimalStatus,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                       //   Text(subCatList[idx][index].AnimalStatusCause,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].AnimalStatusDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          Text(subCatList[idx][index].UpdatedDate,textAlign: TextAlign.start,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                        ],
                      )
                  ),

                ],
              ),
              Text("Vaccine Details:",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              Column(
                children: List.generate(vccDet.length,(index){
                  return  Align(
                    alignment: Alignment.bottomLeft,

                    child: Text("Date :"+vccDet[index].VDate+",details :"+vccDet[index].VDetails,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

                  );
                },
              )
//              Row(
//                children: <Widget>[
//                  Text("Added Date",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                  Text(": "+subCatList[idx][index].AddedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ],
//              )
//              Align(
//                alignment: Alignment.bottomLeft,
//                child:Row(
//                  children: <Widget>[
//                    Text("Added Date",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                    Text(":",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                    Text(subCatList[idx][index].AddedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                  ],
//                )
//
////                FlatButton(
////
////                  color: Colors.green,
////                  textColor: Colors.black,
////                  padding: EdgeInsets.all(8.0),
////                  splashColor: Colors.blueAccent,
////                  shape: RoundedRectangleBorder(
////                      borderRadius: new BorderRadius.circular(50.0),
////                      side: BorderSide(color: Colors.black)
////                  ),
////                  onPressed: () {
////
////                  },
////                  child: Text("Added Date: "+subCatList[idx][index].AddedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
////                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("Animal Breed: "+subCatList[idx][index].AnimalBreed,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("Animal Category: "+subCatList[idx][index].AnimalCategory,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalDOB: "+subCatList[idx][index].AnimalDOB,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalFather: "+subCatList[idx][index].AnimalFather,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child:  Text("AnimalID: "+subCatList[idx][index].AnimalID,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalMother: "+subCatList[idx][index].AnimalMother,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child:  Text("AnimalOwner: "+subCatList[idx][index].AnimalOwner,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalSex: "+subCatList[idx][index].AnimalSex,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalStatus: "+subCatList[idx][index].AnimalStatus,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalStatusCause: "+subCatList[idx][index].AnimalStatusCause,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("AnimalStatusDate: "+subCatList[idx][index].AnimalStatusDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )
//              ,
//              Align(
//                alignment: Alignment.bottomLeft,
//                child: FlatButton(
//
//                  color: Colors.green,
//                  textColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.blueAccent,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      side: BorderSide(color: Colors.black)
//                  ),
//                  onPressed: () {
//
//                  },
//                  child: Text("UpdatedDate: "+subCatList[idx][index].UpdatedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                ),
//              )



            //  Text("Added Date: "+subCatList[idx][index].AddedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            //  Text("Animal Breed: "+subCatList[idx][index].AnimalBreed,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
           //   Text("Animal Category: "+subCatList[idx][index].AnimalCategory,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            //  Text("AnimalDOB: "+subCatList[idx][index].AnimalDOB,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          //    Text("AnimalFather: "+subCatList[idx][index].AnimalFather,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
         //     Text("AnimalID: "+subCatList[idx][index].AnimalID,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
         //     Text("AnimalMother: "+subCatList[idx][index].AnimalMother,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
         //     Text("AnimalOwner: "+subCatList[idx][index].AnimalOwner,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          //    Text("AnimalSex: "+subCatList[idx][index].AnimalSex,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          //    Text("AnimalStatus: "+subCatList[idx][index].AnimalStatus,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          //    Text("AnimalStatusCause: "+subCatList[idx][index].AnimalStatusCause,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
         //     Text("AnimalStatusDate: "+subCatList[idx][index].AnimalStatusDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
             // Text("AnimalWeight: "+subCatList[idx][index].AnimalWeight,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            //  Text("UpdatedDate: "+subCatList[idx][index].UpdatedDate,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),



              )
              ],

              ),

//                                ExpansionTile(
//                                  title:  Text("Vaccine Details", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//                                  children: List.generate(vccDet.length,(index){
//                                    return  Align(
//                                      alignment: Alignment.bottomLeft,
//
//                                        child: Text("Date :"+vccDet[index].VDate+",details :"+vccDet[index].VDetails,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//
//                                    );
//                               }
//                                ))
              ],
                              ),
                              );
                               },
                          ),
                        ),
                      ),
                  ),
                   )
             );
    },
          )

//        Container(
//
//          decoration: BoxDecoration(color:Color.fromRGBO(30,37,43,1)),
//          child: Center(
//            child: Text("Markets"),
//          ),
//        ),

      ),
      )
    );
  }


}