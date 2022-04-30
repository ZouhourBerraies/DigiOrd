

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'listeOrdonnance.dart';
import '../data/CreateOrd.dart';
import 'ListeOrdScanner.dart';




class affichagePharmacie extends StatefulWidget {
  @override
  _affichagePharmacieState createState() => _affichagePharmacieState();
  DocumentSnapshot index;
  String idpatient;
  String idpharmacie;
  affichagePharmacie ({required this.index ,required this.idpatient ,required this.idpharmacie});
}

class _affichagePharmacieState extends State<affichagePharmacie> {

  /* variable */
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<FormState>();
  final CreateOrd ord=CreateOrd();
  //final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');
  TextEditingController _medicController = TextEditingController();
  TextEditingController _NummedicSController = TextEditingController();
  TextEditingController _NumeromedicDController = TextEditingController();

  TextEditingController _signateurController = TextEditingController();


  late final controllerqr = TextEditingController();

  String medic = '';
  String NummedicD='';
  String NummedicS='';


  List itemsList = [];
  dynamic resultS = [];
  dynamic resultD = [];

  String NumeroOrd='X';

  DateTime date = new DateTime.now();


  String signature='';

  void initState() {


    _signateurController= TextEditingController(text: '${widget.index['signature']}');


    super.initState();

  }







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
                      0: FractionColumnWidth(0.10),
                      1: FractionColumnWidth(0.15),
                      2: FractionColumnWidth(0.15),
                      3: FractionColumnWidth(0.15),
                      4: FractionColumnWidth(0.15),
                      5: FractionColumnWidth(0.15),
                      6: FractionColumnWidth(0.15),

                    },
                    children: [

                      buildRow([
                        '${data.docs[index]['numeroMedic']}',
                        '${data.docs[index]['Medicament']}',
                        '${data.docs[index]['dose']}',
                        '${data.docs[index]['par jour']}',
                        '${data.docs[index]['nombre de jour']}',
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




  Widget buildqr(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          // Row(
          //   children: [
          //     Expanded(child: buildTextField(context)),
          //     const SizedBox(width: 12),
          //     FloatingActionButton(
          //       backgroundColor: Theme.of(context).primaryColor,
          //       child: Icon(Icons.done, size: 30),
          //       onPressed: () {
          //         setState(() {});
          //       },
          //     )
          //   ],
          // ),

          //SizedBox(height: 10),
          BarcodeWidget(
            barcode: Barcode.qrCode(),
            color: Colors.black,
            data: controllerqr.text ,
            width: 500,
            height: 50,
          ),
         // SizedBox(height: 16),
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








  /*      **************            */
  @override

  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(


      appBar:
      AppBar(title: Text(
        'Zone Médecin',
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

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 50),
                            child: Row(
                              children: [
                                Icon(Icons.beenhere,
                                    color: Colors.cyan),
                                SizedBox(
                                  width: 20,
                                ),
                                RaisedButton(onPressed: () {
                                  openDialogueBox(context);
                                },
                                  child: Text('Délivrer Médicament',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  color: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  textColor: Colors.cyan.shade600,
                                  padding: EdgeInsets.all(15.0),
                                  splashColor: Colors.cyan.shade600,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8,left: 30,right: 50),
                            child: Row(
                              children: [
                                Icon(Icons.autorenew_outlined,
                                    color: Colors.cyan),
                                SizedBox(
                                  width: 20,
                                ),
                                RaisedButton(onPressed: () {
                                 openDialogueBoxSub(context);
                                },
                                  child: Text('Substituer Médicament',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  color: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  textColor: Colors.cyan.shade600,
                                  padding: EdgeInsets.all(15.0),
                                  splashColor: Colors.cyan.shade600,
                                ),
                              ],
                            ),
                          )
                        ],
                      )

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

                                      },
                                      children: [
                                        buildRow(['Numero','Médicament', 'Dose', 'NbrJour','NbrFois par Jour','Délivré','Substitué'],isHeader: true),
                                      ],
                                    ),
                                    SizedBox(
                                      // height: 10,
                                      child:buildAff(),
                                    ),
                                    SizedBox(height: 10,),
                                    buildqr(context),
                                    SizedBox(height: 10,),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.save_rounded,
                                            color: Colors.cyan),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        RaisedButton(onPressed: () {
                                          ord.AjouterOrdPhar(date,widget.idpharmacie ,widget.index["nom medecin"], widget.index["num medecin"],widget.idpatient, widget.index["patient"], widget.index['signature'], widget.index['numero']);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Sending data to cloud firesstore'),
                                            ),
                                          );
                                          //Navigator.pop(context);

                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (_) =>gerer_ord_phar(idpharmacie: widget.idpharmacie,


                                          )));

                                        },
                                          child: Text('Scanner',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                          color: Colors.white60,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          textColor: Colors.cyan.shade600,
                                          padding: EdgeInsets.all(15.0),
                                          splashColor: Colors.cyan.shade300,
                                        ),
                                      ],
                                    ),






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
          /*------------------zou----------------*/
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

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('délivrer Medicament'),
            content: Container(
              height: 100,
              child: Form(
                key: _Key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _NumeromedicDController,
                      decoration: InputDecoration(hintText: 'Numero medicament'),
                      onChanged: (value) {
                        NummedicD = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez numero de medicament à deliver!';
                        } else
                          return null;
                      },
                    ),

                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_Key.currentState!.validate()) {
                    submitAction(context);
                    Navigator.pop(context);
                  }
                },
                child: Text('délivrer'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) async{
    ord.delivrerMedic(NummedicD,widget.index['numero'], widget.idpatient);
    resultD = await ord.getCurrentUserData(widget.idpatient, widget.index['numero'], NummedicD);
    //ord.DelivMedic(widget.index['numero'], NummedicD, widget.index['medicament'], widget.index['dose'], widget.index['parjour'],widget.index['nbrjour'], widget.idpharmacie);
    ord.DelivMedic(widget.index['numero'], NummedicD, resultD[0], resultD[1], resultD[2], resultD[3], widget.idpharmacie);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );
    _NumeromedicDController.clear();

  }

  openDialogueBoxSub(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('substituer Medicament'),
            content: Container(
              height: 100,
              child: Form(
                key: _Key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _NummedicSController,
                      decoration: InputDecoration(hintText: 'Numero medicament à substituer'),
                      onChanged: (value) {
                        NummedicS = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez numero de medicament à substituer!';
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                      controller: _medicController,
                      decoration: InputDecoration(hintText: ' nouveau medicament'),
                      onChanged: (value) {
                        medic = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez le nouveau nom de medicament à substituer!';
                        } else
                          return null;
                      },
                    ),

                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_Key.currentState!.validate()) {
                    submitActionSub(context);
                    Navigator.pop(context);
                  }
                },
                child: Text('substituer'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitActionSub(BuildContext context) async{
    ord.substituerMedic(NummedicS, medic, widget.index['numero'], widget.idpatient);
     resultS = await ord.getCurrentUserData(widget.idpatient, widget.index['numero'], NummedicD);
    //ord.SubMedic(widget.index['numero'], NummedicS, resultS[0], resultS[1], resultS[2], resultS[3], widget.idpharmacie,medic);
    ord.SubMedic("191", "0", "medicament", 1000, 3, 7, widget.idpharmacie, medic);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );
    _medicController.clear();
    _NummedicSController.clear();

  }


}
String formattedDate(timeStamp) {
  var dateFromTimeStamp =
  DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
}