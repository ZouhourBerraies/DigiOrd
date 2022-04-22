import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/gereDossier.dart';




class Addnote extends StatefulWidget {

  String idmedecin;

  String idpatient;

  Addnote({required this.idmedecin, required this.idpatient});

  @override

  _AddnoteState createState() => _AddnoteState();

}




class _AddnoteState extends State<Addnote> {

  final _key = GlobalKey<FormState>();

  TextEditingController numpatient = TextEditingController();

  TextEditingController nommedecin = TextEditingController();

  TextEditingController content = TextEditingController();

  TextEditingController time = TextEditingController();




  DateTime date = new DateTime.now();

  bool isUserNameValidate = false;

  final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');

  // final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('profileInfoPatient').doc(widget.idpatient).collection('ListeOrdonnance').doc(random).collection("ListeMedicament").snapshots();




  bool validateTextField(String userInput) {

    if (userInput.isEmpty) {

      setState(() {

        isUserNameValidate = true;

      });

      return false;

    }

    setState(() {

      isUserNameValidate = false;

    });

    return true;

  }




  @override

  Widget build(BuildContext context) {

    // TODO: implement build

    return Scaffold(

      appBar: AppBar(

          title: Text(

            'Dossier Médical',

            style: TextStyle(

              fontSize: 30.0,

              fontWeight: FontWeight.bold,

              color: Colors.white,

            ),

          ),

          backgroundColor: Colors.cyan.shade700),

      body: Container(

        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(

          children: [

            Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                TextField(

                  controller: time,

                  decoration: InputDecoration(

                    hintText: "$date",

                    hintStyle: TextStyle(

                      color: Color.fromARGB(255, 198, 196, 196),

                    ),

                  ),

                ),

                SizedBox(height: 16),

                ElevatedButton(

                  child: Text(

                    'Entrer la date d\'aujourd\'hui',

                  ),

                  style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(

                          Colors.cyan.shade700)),

                  onPressed: () async {

                    DateTime? newDate = await showDatePicker(

                      context: context,

                      initialDate: date,

                      firstDate: DateTime(1999),

                      lastDate: DateTime(2100),

                    );

                    if (newDate == null) return;

                    setState(() => date = newDate);

                    time.text = '${date.year}/${date.month}/${date.day}';

                  },

                ),

              ],

            ),

            SizedBox(

              height: 10,

            ),

            TextField(

                controller: nommedecin,

                decoration: InputDecoration(

                  filled: true,

                  fillColor: Color.fromARGB(255, 235, 233, 233),

                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(

                      color: Color.fromARGB(255, 198, 196, 196),

                    ),

                    borderRadius: BorderRadius.circular(10.0),

                  ),

                  hintText: "Entrer le nom du Medecin ...",

                  hintStyle: TextStyle(

                    color: Color.fromARGB(255, 6, 6, 6),

                    fontStyle: FontStyle.italic,

                  ),

                )),

            SizedBox(

              height: 10,

            ),

            TextField(

                controller: numpatient,

                decoration: InputDecoration(

                  filled: true,

                  fillColor: Color.fromARGB(255, 235, 233, 233),

                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(

                      color: Color.fromARGB(255, 198, 196, 196),

                    ),

                    borderRadius: BorderRadius.circular(10.0),

                  ),

                  hintText: "Entrer le numero du Patient ...",

                  hintStyle: TextStyle(

                    color: Color.fromARGB(255, 6, 6, 6),

                    fontStyle: FontStyle.italic,

                  ),

                )),

            SizedBox(

              height: 10,

            ),

            Expanded(

              child: TextField(

                controller: content,

                maxLines: null,

                expands: true,

                decoration: InputDecoration(

                    filled: true,

                    fillColor: Color.fromARGB(255, 235, 233, 233),

                    enabledBorder: OutlineInputBorder(

                      borderSide: BorderSide(

                        color: Color.fromARGB(255, 198, 196, 196),

                      ),

                      borderRadius: BorderRadius.circular(10.0),

                    ),

                    hintText: "Entrer les informations  ...",

                    hintStyle: TextStyle(

                      color: Color.fromARGB(255, 4, 4, 4),

                      fontStyle: FontStyle.italic,

                    ),

                    contentPadding: const EdgeInsets.all(20.0)),

              ),

            ),

            SizedBox(

              height: 10,

            ),

            ElevatedButton.icon(

                onPressed: () {

                  createdossier();




                  Navigator.push(

                      context,

                      MaterialPageRoute(

                          builder: (_) => gerer_doss(

                              idpatient: widget.idpatient,

                              idmedecin: widget.idmedecin)));

                },

                style: ButtonStyle(

                    backgroundColor:

                    MaterialStateProperty.all<Color>(Colors.cyan.shade700)),

                icon: const Icon(Icons.save),

                label: const Text('Save')),

          ],

        ),

      ),

    );

  }




  void createdossier() async {

    profilList

        .doc(widget.idpatient)

        .collection('Listedossiers')

        .doc()

        .set({

      'Date': time.text,

      'NomMedecin': nommedecin.text,

      'Numpatient': numpatient.text,

      'content': content.text,

    })

        .then((value) => print('dossier added'))

        .catchError((error) => print('erreur add dossier:$error'));

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text('Sending data to cloud firesstore'),

      ),

    );

  }

}






