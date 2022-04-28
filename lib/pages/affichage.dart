

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../data/authentification.dart';






class affichage extends StatefulWidget {
  @override
  _affichageState createState() => _affichageState();
  DocumentSnapshot index;
  String idpatient;
  affichage({required this.index ,required this.idpatient});
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






  Widget buildRnadom(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [

              Expanded(
                flex:1,
                child:Container(
                  width: 100,
                  // height: 70,
                  alignment: Alignment.center,
                  color: Colors.white,),
              ),
              Expanded(
                flex:2,
                child:Container(
                  width: 100,
                  // height: 70,
                  alignment: Alignment.center,
                  color: Colors.white,),
              ),

              Expanded(flex:3,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    //height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          //offset: new Offset(10.0, 10.0),
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text("Numéro d\'ordonnance: ${widget.index['numero']}",
                            style: TextStyle(fontSize: 20))
                    ),
                  )
              ),

            ],
          ),
        ]

    );
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

          Row(
            children: [
              Expanded(child: buildTextField(context)),
              const SizedBox(width: 12),
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.done, size: 30),
                onPressed: () {
                  setState(() {});
                },
              )
            ],
          ),

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

  Widget buildMedecin(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [

            Container(
              width: 500,
              //height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    // color: Colors.grey,
                      color:  Color.fromARGB(255, 235, 233, 233)
                    // offset: new Offset(10.0, 10.0),
                  ),
                ],
              ),
              child: Center(
                  child: Text("Nom de medecin: ${widget.index["nom medecin"]}",
                    style: TextStyle(fontSize: 20),
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPatient(){

    return  Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [

            Container(
              //width: 250,
              //height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    // color: Colors.grey,
                      color:  Color.fromARGB(255, 235, 233, 233)
                    // offset: new Offset(10.0, 10.0),
                  ),
                ],
              ),
              child: Center(
                  child: Text("Nom de Patient: ${widget.index["patient"]}",

                    style: TextStyle(fontSize: 20),
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }





  /*      **************            */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'ordonnance',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue.shade500),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
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
                              SizedBox(
                                width: double.infinity,
                                child:
                                Text(
                                  //'Date:${widget.index['date'].toDate().toString()}',
                                  'Date : ${formattedDate(widget.index['date'])}',

                                  //'Date: ${date.day}/${date.month}/${date.year}',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.right,

                                ),),



                              SizedBox(
                                height: 16,
                              ),
                              buildRnadom(),

                              SizedBox(
                                height: 10,
                              ),
                              buildMedecin(),

                              SizedBox(
                                height: 10,
                              ),
                              buildPatient(),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(

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
                                    buildRow(['numero','medicament', 'dose', 'parjour', 'nbrJour','délivrer','substituer'],isHeader: true),

                                  ],
                                ),
                              ),
                              //),
                              SizedBox(
                                //height: 10,
                                child:buildAff(),
                              ),
                              SizedBox(height: 10,),
                              buildqr(context),
                            ],
                          ),
                        ),
                      ), )
                  ]))),
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