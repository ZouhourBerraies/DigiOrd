

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'gereOrdonnance.dart';





class affichagePharmacie extends StatefulWidget {
  @override
  _affichagePharmacieState createState() => _affichagePharmacieState();
  DocumentSnapshot index;
  String idpatient;
  affichagePharmacie ({required this.index ,required this.idpatient});
}

class _affichagePharmacieState extends State<affichagePharmacie> {

  /* variable */
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<FormState>();

  final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');
  TextEditingController _medicController = TextEditingController();
  TextEditingController _NummedicController = TextEditingController();
  TextEditingController _parjourController = TextEditingController();
  TextEditingController _nbrjourController = TextEditingController();
  TextEditingController _patientController = TextEditingController();
  TextEditingController _medecinController = TextEditingController();
  TextEditingController _signateurController = TextEditingController();


  late final controllerqr = TextEditingController();

  String medic = '';
  String Nummedic='';
  int dose = 0;
  int nbrjour = 0;
  int parjour = 0;
  List itemsList = [];
  int patient=0;
  int medecin=0;
  String random='X';

  DateTime date = new DateTime.now();


  String signature='';
  String id='X';

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
  Widget buildAjouter(){
    return

      Row(
          children: [
            Expanded(flex:1,child:Container(
              width: 50,
              // height: 70,
              color: Colors.white,),
            ),
            Expanded(
              flex:2,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  openDialogueBox(context);
                },
                icon: const Icon(Icons.done),
                label: const Text('délivrer'),
              ),
            ),
            Expanded(flex:3,child:Container(
              width: 50,
              // height: 70,
              color: Colors.white,),
            ),
            Expanded(
              flex:4,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  openDialogueBoxSub(context);
                },
                icon: const Icon(Icons.done),
                label: const Text('substituer'),
              ),
            ),


          ]
      );
    /* FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
    child: Icon(Icons.done, size: 10),
    onPressed: () {
    //setState(() {});
    },
      );*/
    /*IconButton(
        icon: const Icon(Icons.android),
        color: Colors.black,
        onPressed: () {},
      );*/
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
  /*void initState(){
    getData();
    super.initState();
  }*/
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
      /*floatingActionButton:FloatingActionButton(
        onPressed: () {
          openDialogueBox(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
          semanticLabel: 'ajouter medicament',
        ),
      ),*/
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      //decoration: BoxDecoration(
                      /*gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.indigo.shade400,
                              Colors.indigo.shade300,
                              Colors.indigo.shade200,
                              Colors.indigo.shade100,
                            ])*/
                      //),
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

                              SizedBox(height: 16),
                              /*ElevatedButton(
                                child: Text(
                                  'Entrer la date d\'aujourd\'hui',
                                ),
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(1999),
                                    lastDate: DateTime(2100),
                                  );
                                  if (newDate == null) return;
                                  setState(() => date = newDate);
                                },
                              ),*/
                              SizedBox(
                                height: 10,
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
                              buildAjouter(),
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
                                    //buildRow(['${itemsList['Medicament']}', 'cell2', 'cell3']),
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
                              SizedBox(height: 10,),
                              /*ElevatedButton.icon(
                                  onPressed: (){
                                    ordList.doc(random)
                                        .set({
                                      'date':date,
                                      'medecin': medecin,
                                      'patient':patient,
                                      'signature':signature,
                                    }).then((value) => print('user added'))
                                        .catchError((error) => print('erreur add user:$error'));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Sending data to cloud firesstore'),
                                      ),
                                    );
                                    //Navigator.pop(context);

                                    /*Navigator.push(
                                        context, MaterialPageRoute(builder: (_) => gerer_doss()));*/
                                  },
                                  icon: const Icon(Icons.save),
                                  label: const Text('Save')),*/
                              /*Scrollbar(
              showTrackOnHover: true,
              child:buildqr(context),
            ),*/



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
                      controller: _medicController,
                      decoration: InputDecoration(hintText: 'Numero medicament'),
                      onChanged: (value) {
                        medic = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez numero de medicament à deliver!';
                        } else
                          return null;
                      },
                    ),
                    /*TextFormField(
                      controller: _doseController,
                      decoration: InputDecoration(hintText: 'dose'),
                      onChanged: (value) {
                        dose = int.parse(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quel est la dose de medicament?';
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                      controller: _parjourController,
                      decoration: InputDecoration(hintText: 'parjour'),
                      onChanged: (value) {
                        parjour = int.parse(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Combien de fois par jour?';
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                      controller: _nbrjourController,
                      decoration: InputDecoration(hintText: 'nbrJour'),
                      onChanged: (value) {
                        nbrjour = int.parse(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'combien de jour utilise ce médicament?';
                        } else
                          return null;
                      },
                    )*/
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

  submitAction(BuildContext context) {
    profilList.doc(widget.idpatient).collection('ListeOrdonnance').doc(widget.index['numero']).collection("ListeMedicament")
        .doc(medic)
        .update({
      "délivrer":"oui"
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );
    _medicController.clear();

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
                      controller: _NummedicController,
                      decoration: InputDecoration(hintText: 'Numero medicament à substituer'),
                      onChanged: (value) {
                        Nummedic = value;
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
                    /*TextFormField(
                      controller: _parjourController,
                      decoration: InputDecoration(hintText: 'parjour'),
                      onChanged: (value) {
                        parjour = int.parse(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Combien de fois par jour?';
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                      controller: _nbrjourController,
                      decoration: InputDecoration(hintText: 'nbrJour'),
                      onChanged: (value) {
                        nbrjour = int.parse(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'combien de jour utilise ce médicament?';
                        } else
                          return null;
                      },
                    )*/
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

  submitActionSub(BuildContext context) {
    profilList.doc(widget.idpatient).collection('ListeOrdonnance').doc(widget.index['numero']).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      "substituer":medic
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );
    _medicController.clear();

  }



}
String formattedDate(timeStamp) {
  var dateFromTimeStamp =
  DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
}