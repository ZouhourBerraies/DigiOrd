//
//
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// //import 'package:qr_flutter/qr_flutter.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import '../data/authentification.dart';
//
//
//
//
//
//
// class affichage extends StatefulWidget {
//   @override
//   _affichageState createState() => _affichageState();
//   DocumentSnapshot index;
//   String idpatient;
//   affichage({required this.index ,required this.idpatient});
// }
//
// class _affichageState extends State<affichage> {
//
//   /* variable */
//   final _formKey = GlobalKey<FormState>();
//
//   final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');
//
//   TextEditingController _signateurController = TextEditingController();
//
//
//   late final controllerqr = TextEditingController();
//
//   List itemsList = [];
//   String signature='';
//
//
//   void initState() {
//
//
//     _signateurController= TextEditingController(text: '${widget.index['signature']}');
//
//
//     super.initState();
//
//   }
//
//
//
//
//
//
//   Widget buildRnadom(){
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: [
//
//               Expanded(
//                 flex:1,
//                 child:Container(
//                   width: 100,
//                   // height: 70,
//                   alignment: Alignment.center,
//                   color: Colors.white,),
//               ),
//               Expanded(
//                 flex:2,
//                 child:Container(
//                   width: 100,
//                   // height: 70,
//                   alignment: Alignment.center,
//                   color: Colors.white,),
//               ),
//
//               Expanded(flex:3,
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 100,
//                     //height: 100,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.lightBlue,
//                         width: 5,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         new BoxShadow(
//                           color: Colors.grey,
//                           //offset: new Offset(10.0, 10.0),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                         child: Text("Numéro d\'ordonnance: ${widget.index['numero']}",
//                             style: TextStyle(fontSize: 20))
//                     ),
//                   )
//               ),
//
//             ],
//           ),
//         ]
//
//     );
//   }
//
//   Widget buildAff() {
//     final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('profileInfoPatient').doc(widget.idpatient).collection('ListeOrdonnance').doc(widget.index['numero']).collection("ListeMedicament").snapshots();
//
//     return Container(
//       height: 250,
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child:
//       StreamBuilder<QuerySnapshot>(
//         stream: users,
//         builder: (BuildContext context,
//             AsyncSnapshot<QuerySnapshot>snapshot,) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong.');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text('Loading');
//           }
//           final data = snapshot.requireData;
//           return ListView.builder(
//             //scrollDirection: Axis.vertical,
//             //physics: NeverScrollableScrollPhysics(),
//             //addAutomaticKeepAlives: false,
//             //cacheExtent: 100.0,
//             itemCount: data.size,
//             itemBuilder: (context, index) {
//               itemsList.add(data.docs[index]);
//               return
//                 Center(
//                   child:
//                   Table(
//                     border: TableBorder.all(),
//                     columnWidths: {
//                       0: FractionColumnWidth(0.10),
//                       1: FractionColumnWidth(0.15),
//                       2: FractionColumnWidth(0.15),
//                       3: FractionColumnWidth(0.15),
//                       4: FractionColumnWidth(0.15),
//                       5: FractionColumnWidth(0.15),
//                       6: FractionColumnWidth(0.15),
//
//                     },
//                     children: [
//
//                       buildRow([
//                         '${data.docs[index]['numeroMedic']}',
//                         '${data.docs[index]['Medicament']}',
//                         '${data.docs[index]['dose']}',
//                         '${data.docs[index]['par jour']}',
//                         '${data.docs[index]['nombre de jour']}',
//                         '${data.docs[index]['délivrer']}',
//                         '${data.docs[index]['substituer']}',
//
//
//
//
//                       ]),
//                     ],
//                   ),
//                 );
//             },
//           );
//         },
//
//       ),
//
//     );
//   }
//
//
//
//
//   Widget buildqr(BuildContext context) {
//     return Container(
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//
//           Row(
//             children: [
//               Expanded(child: buildTextField(context)),
//               const SizedBox(width: 12),
//               FloatingActionButton(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 child: Icon(Icons.done, size: 30),
//                 onPressed: () {
//                   setState(() {});
//                 },
//               )
//             ],
//           ),
//
//           SizedBox(height: 10),
//           BarcodeWidget(
//             barcode: Barcode.qrCode(),
//             color: Colors.black,
//             data: controllerqr.text ,
//             width: 500,
//             height: 50,
//           ),
//           SizedBox(height: 16),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTextField(BuildContext context) => TextFormField(
//     controller: controllerqr,
//     //   controller:_signateurController,
//     onChanged: (value){
//       signature=value;
//     },
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return 'entrer votre signature !';
//       } else
//         return null;
//     },
//     style: TextStyle(
//       color: Colors.black,
//       fontSize: 20,
//     ),
//     decoration: InputDecoration(
//       //hintText: 'Enter Signature',
//       hintText: '${_signateurController.text} ',
//
//       hintStyle: TextStyle(color: Colors.grey),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(16),
//         borderSide: BorderSide(color: Colors.black),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(16),
//         borderSide: BorderSide(
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//     ),
//   );
//
//   Widget buildMedecin(){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//
//             Container(
//               width: 500,
//               //height: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.lightBlue,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   new BoxShadow(
//                     // color: Colors.grey,
//                       color:  Color.fromARGB(255, 235, 233, 233)
//                     // offset: new Offset(10.0, 10.0),
//                   ),
//                 ],
//               ),
//               child: Center(
//                   child: Text("Nom de medecin: ${widget.index["nom medecin"]}",
//                     style: TextStyle(fontSize: 20),
//                   )
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildPatient(){
//
//     return  Column( crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Column(
//           children: [
//
//             Container(
//               //width: 250,
//               //height: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.lightBlue,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   new BoxShadow(
//                     // color: Colors.grey,
//                       color:  Color.fromARGB(255, 235, 233, 233)
//                     // offset: new Offset(10.0, 10.0),
//                   ),
//                 ],
//               ),
//               child: Center(
//                   child: Text("Nom de Patient: ${widget.index["patient"]}",
//
//                     style: TextStyle(fontSize: 20),
//                   )
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//
//
//
//
//   /*      **************            */
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//             'ordonnance',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           backgroundColor: Colors.blue.shade500),
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//           value: SystemUiOverlayStyle.light,
//           child: GestureDetector(
//               child: Stack(
//                   children: <Widget>[
//                     Container(
//                       height: double.infinity,
//                       width: double.infinity,
//                       child: SingleChildScrollView(
//                         physics: AlwaysScrollableScrollPhysics(),
//                         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//                         child:Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: double.infinity,
//                                 child:
//                                 Text(
//                                   //'Date:${widget.index['date'].toDate().toString()}',
//                                   'Date : ${formattedDate(widget.index['date'])}',
//
//                                   //'Date: ${date.day}/${date.month}/${date.year}',
//                                   style: TextStyle(fontSize: 20),
//                                   textAlign: TextAlign.right,
//
//                                 ),),
//
//
//
//                               SizedBox(
//                                 height: 16,
//                               ),
//                               buildRnadom(),
//
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               buildMedecin(),
//
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               buildPatient(),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//
//                                 child:
//                                 Table(
//                                   border: TableBorder.all(),
//                                   columnWidths: {
//                                     0: FractionColumnWidth(0.10),
//                                     1: FractionColumnWidth(0.15),
//                                     2: FractionColumnWidth(0.15),
//                                     3: FractionColumnWidth(0.15),
//                                     4: FractionColumnWidth(0.15),
//                                     5: FractionColumnWidth(0.15),
//                                     6: FractionColumnWidth(0.15),
//
//
//                                   },
//                                   children: [
//                                     buildRow(['numero','medicament', 'dose', 'parjour', 'nbrJour','délivrer','substituer'],isHeader: true),
//
//                                   ],
//                                 ),
//                               ),
//                               //),
//                               SizedBox(
//                                 //height: 10,
//                                 child:buildAff(),
//                               ),
//                               SizedBox(height: 10,),
//                               buildqr(context),
//                             ],
//                           ),
//                         ),
//                       ), )
//                   ]))),
//     );
//   }
//
//
//
//   TableRow buildRow(List<String> cells, {bool isHeader = false}) =>
//       TableRow(
//           children: cells.map((cell) {
//             final style = TextStyle(
//               fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//               fontSize: 18,
//             );
//
//             return Padding(
//               padding: const EdgeInsets.all(12),
//               child: Center(child: Text(cell)),
//             );
//           }).toList());
//
// }
// String formattedDate(timeStamp) {
//   var dateFromTimeStamp =
//   DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
//   return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
// }
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class affichage extends StatefulWidget {
  DocumentSnapshot index;
  String idpatient;
  affichage({required this.index ,required this.idpatient});
  @override
  State<StatefulWidget> createState() {
    return new _affichageState();
  }
}
class _affichageState extends State<affichage> {

  /* variable */
  final _formKey = GlobalKey<FormState>();

  final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');

  TextEditingController _signateurController = TextEditingController();


  late final controllerqr = TextEditingController();

  List itemsList = [];
  String signature='';


  void initState() {


    _signateurController= TextEditingController(text: '${widget.index['signature']}');


    super.initState();

  }

  Widget buildqr(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          // Row(
          //   children: [
          //     Expanded(child: buildTextField(context)),
          //     const SizedBox(width: 12),
          //     // FloatingActionButton(
          //     //   backgroundColor: Theme.of(context).primaryColor,
          //     //   child: Icon(Icons.done, size: 30),
          //     //   onPressed: () {
          //     //     setState(() {});
          //     //   },
          //     // )
          //   ],
          // ),

          SizedBox(height: 10),
          BarcodeWidget(
            barcode: Barcode.qrCode(),
            color: Colors.black,
            data: controllerqr.text ,
            width: 500,
            height: 50,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextFormField(
    controller: controllerqr,
    //   controller:_signateurController,
    onChanged: (value){
      signature=value;
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'entrer votre signature !';
      } else
        return null;
    },
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      //hintText: 'Enter Signature',
      hintText: '${_signateurController.text} ',

      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );

  Widget buildAff() {
    final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('profileInfoPatient').doc(widget.idpatient).collection('ListeOrdonnance').doc(widget.index['numero']).collection("ListeMedicament").snapshots();

    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child:
      StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot>snapshot,) {
          if (snapshot.hasError) {
            return Text('Something went wrong.');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          final data = snapshot.requireData;
          return ListView.builder(
            //scrollDirection: Axis.vertical,
            //physics: NeverScrollableScrollPhysics(),
            //addAutomaticKeepAlives: false,
            //cacheExtent: 100.0,
            itemCount: data.size,
            itemBuilder: (context, index) {
              itemsList.add(data.docs[index]);
              return
                Center(
                  child:
                  Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FractionColumnWidth(0.15),
                      1: FractionColumnWidth(0.15),
                      2: FractionColumnWidth(0.15),
                      3: FractionColumnWidth(0.15),
                      4: FractionColumnWidth(0.15),
                      5: FractionColumnWidth(0.15),
                      //6: FractionColumnWidth(0.15),

                    },
                    children: [

                      buildRow([
                        //'${data.docs[index]['numeroMedic']}',
                        '${data.docs[index]['medicament']}',
                        '${data.docs[index]['nombre de fois par jour']}',
                        '${data.docs[index]['nombre de jour']}',
                        '${data.docs[index]['remarque']}',
                        '${data.docs[index]['délivrer']}',
                        '${data.docs[index]['substituer']}',




                      ]),
                    ],
                  ),
                );
            },
          );
        },

      ),

    );
  }





  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(


      appBar:
      AppBar(title: Text(
        '',
        style:TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ), backgroundColor: Colors.cyan.shade700,


        automaticallyImplyLeading: false,
        actions: [
          RaisedButton(
            onPressed: () async {

              //Navigator.push(context, MaterialPageRoute(builder: (context) => accueil()));

              Navigator.pop(context);
            },
            child : Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            color: Colors.cyan.shade700,
          ),
        ],
      ),


      backgroundColor: Colors.white30,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  Text(
                    'Ordonnance Médicale',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.cyan.shade700,
                    ),
                  ),
                  Text(
                    'Ordonnance Médicale',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.cyan.shade50,
                    ),
                  )
                ],
              ) ,
            ],
          ),
          Expanded(
            child: Column(
                children: [
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 32,right: 30, top: 25, bottom: 10),
                        child: Text(
                          //'Date:${widget.index['date'].toDate().toString()}',
                          // 'Date : ${formattedDate(widget.index['date'])}',
                          'Date : ${formattedDate(widget.index['date'])}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Stack(
                        children: [
                          Container(
                            height: 80,
                            width:500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                              color: Colors.cyan.shade50,
                            ),
                          ),

                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 32, top: 25, bottom: 10),
                                child: new Text(
                                  "Nom du Médecin: ${widget.index["nom medecin"]}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.cyan.shade700,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      new Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 50),
                        //height: 150,
                        padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                        child: new Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-10.0, 10.0), //(x,y)
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(left: 32, top: 25, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Numéro Ordonnance : ${widget.index['numero']}',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Stack(
                        children: [
                          Container(
                            height: 80,
                            width:500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                              color: Colors.cyan.shade50,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 32, top: 25, bottom: 10),
                                child: new Text(
                                  "Nom du Patient: ${widget.index["patient"]}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.cyan.shade700,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                ]),
          ),
          Expanded(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: GestureDetector(
                    child: Stack(
                        children: <Widget>[
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                              child:Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Table(
                                      border: TableBorder.all(),
                                      columnWidths: {
                                        0: FractionColumnWidth(0.15),
                                    1: FractionColumnWidth(0.15),
                                    2: FractionColumnWidth(0.15),
                                    3: FractionColumnWidth(0.15),
                                    4: FractionColumnWidth(0.15),
                                    5: FractionColumnWidth(0.15),
                                   // 6: FractionColumnWidth(0.15),
                                      },
                                      children: [
                                        buildRow(['Médicament', 'Nombre de fois par jour','Nombre de Jour','remarque' ,'Délivré','Substitué'],isHeader: true),
                                      ],
                                    ),
                                    SizedBox(
                                     // height: 10,
                                      child:buildAff(),
                                    ),
                                    SizedBox(height: 10,),
                                    buildqr(context),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]
                    )
                )
            ),
          ),
        ],
      ),
    );
  }
  TableRow buildRow(List<String> cells, {bool isHeader = false}) =>
      TableRow(
          children: cells.map((cell) {
            final style = TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
            );

            return Padding(
              padding: const EdgeInsets.all(12),
              child: Center(child: Text(cell)),
            );
          }).toList());
}
String formattedDate(timeStamp) {
  var dateFromTimeStamp =
  DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
}