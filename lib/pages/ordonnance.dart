
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';




class Addord extends StatefulWidget {
  @override
  _AddordState createState() => _AddordState();
}

class _AddordState extends State<Addord> {

  /* variable */
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<FormState>();
  final CollectionReference ordList = FirebaseFirestore.instance.collection('ListeOrdonnance');
  TextEditingController _medicController = TextEditingController();
  TextEditingController _doseController = TextEditingController();
  TextEditingController _parjourController = TextEditingController();
  TextEditingController _nbrjourController = TextEditingController();
  TextEditingController _patientController = TextEditingController();
  TextEditingController _medecinController = TextEditingController();
  TextEditingController _signateurController = TextEditingController();


  final controllerqr = TextEditingController();

  String medic = '';
  int dose = 0;
  int nbrjour = 0;
  int parjour = 0;
  List itemsList = [];
  int patient=0;
  int medecin=0;
  String random='X';
  DateTime date = DateTime(2022, 03, 22);


  Widget buildRnadom(){
    return Row(
      children: [

        Text(
          "Numéro d\'ordonnance: $random",
          style: TextStyle(
              fontSize: 20.0),
        ),
        SizedBox(width: 20,),

        Expanded(
          flex:1,
          child:
          ElevatedButton(
            child: Text('Numero Oradonnance'),
            onPressed: (){
              setState(() {});
              random= Random().nextInt(500).toString();
            },
          ),
        ),
        Expanded(flex:2,child:Container(
          width: 50,
          // height: 70,
          color: Colors.white,),
        ),



      ],
    );
  }
  Widget buildAjouter(){
    return Row(
      children: [
        Expanded(flex:1,child:Container(
          width: 50,
          // height: 70,
          color: Colors.white,),
        ),
        Expanded(
          child:
          ElevatedButton.icon(
            onPressed: () {
              openDialogueBox(context);
            },
            icon: const Icon(Icons.add),
            label: const Text('ajouter medicament'),
          ),
        ),
        SizedBox(
          width: 30,
        ),



      ],
    );
  }
  /*Widget buildAff() {
    final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('ListeOrdonnance').doc(random).collection("ListeMedicament").snapshots();

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
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FractionColumnWidth(0.35),
                    1: FractionColumnWidth(0.15),
                    2: FractionColumnWidth(0.25),
                    3: FractionColumnWidth(0.25),
                  },
                  children: [

                    buildRow([
                      '${data.docs[index]['Medicament']}',
                      '${data.docs[index]['dose']}',
                      '${data.docs[index]['par jour']}',
                      '${data.docs[index]['nombre de jour']}'
                    ]),
                  ],
                );
            },
          );
        },

      ),

    );
  }*/




  Widget buildqr(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //buildsave(context),
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

  Widget buildTextField(BuildContext context) => TextField(
    controller: controllerqr,
    style: TextStyle(
      color: Colors.black,
      //fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Enter Signature',
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
        TextFormField(
            controller: _medecinController,
            onChanged: (value){
              medecin =int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name cannot be empty';
              } else
                return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue.shade200,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 250, 251, 252),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "Entrer numero du Medecin ...",
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontStyle: FontStyle.italic,
              ),
            )),
      ],
    );
  }
  Widget buildPatient(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            controller: _patientController,
            onChanged: (value){
              patient=int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {

                return 'Name cannot be empty';
              } else
                return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue.shade200,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue.shade200,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "Entrer le nom du Patient ...",
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontStyle: FontStyle.italic,
              ),
            )),
      ],);}








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
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        child:Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                '${date.day}/${date.month}/${date.year}',
                                style: TextStyle(fontSize: 32),
                                textAlign: TextAlign.left,

                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
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
                              ),
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
                              buildRnadom(),
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
                                    0: FractionColumnWidth(0.35),
                                    1: FractionColumnWidth(0.15),
                                    2: FractionColumnWidth(0.25),
                                    3: FractionColumnWidth(0.25),
                                  },
                                  children: [
                                    buildRow(['medicament', 'dose', 'parjour', 'nbrJour'],isHeader: true),
                                    //buildRow(['${itemsList['Medicament']}', 'cell2', 'cell3']),
                                  ],
                                ),
                              ),
                              //),
                              SizedBox(
                                //height: 10,
                                //child:buildAff(),
                                 ),
                              SizedBox(height: 10,),
                              buildqr(context),
                              SizedBox(height: 10,),
                              ElevatedButton.icon(
                                  onPressed: ()
                                  {
                                   /* ordList.doc(random)
                                        .set({
                                      'date':date,
                                      'medecin': medecin,
                                      'patient':patient,
                                    }).then((value) => print('user added'))
                                        .catchError((error) => print('erreur add user:$error'));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Sending data to cloud firesstore'),
                                      ),
                                    );     */
                                    },
                                  icon: const Icon(Icons.save),
                                  label: const Text('Save')),




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
            title: Text('Ajouter Medicament'),
            content: Container(
              height: 300,
              child: Form(
                key: _Key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _medicController,
                      decoration: InputDecoration(hintText: 'medicament'),
                      onChanged: (value) {
                        medic = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez nom de medicament!';
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
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
                    )
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    submitAction(context);
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
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
   /* ordList.doc(random).collection("ListeMedicament")
        .add({'Medicament': medic,
      'dose': dose,
      'par jour': parjour,
      'nombre de jour': nbrjour,
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );*/
    _medicController.clear();
    _doseController.clear();
    _parjourController.clear();
    _nbrjourController.clear();
  }
}