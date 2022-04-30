import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ListeDossier.dart';

class Addnote extends StatefulWidget {
  String idmedecin;
  String idpatient;
  String nommedecin;
  String nompatient;


  Addnote(
      {required this.idmedecin,
        required this.idpatient,
        required this.nommedecin,
        required this.nompatient,
      });
  @override
  _AddnoteState createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  final _key = GlobalKey<FormState>();
  TextEditingController nompatient = TextEditingController();
  TextEditingController nommedecin = TextEditingController();
  TextEditingController idmedecin = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController time = TextEditingController();

  DateTime date = new DateTime.now();
  bool isUserNameValidate = false;
  final CollectionReference profilList =
  FirebaseFirestore.instance.collection('profileInfoPatient');
  // final Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection('profileInfoPatient').doc(widget.idpatient).collection('ListeOrdonnance').doc(random).collection("ListeMedicament").snapshots();

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
                    //time.text = '${date.year}/${date.month}/${date.day}';
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
                  hintText: "Nom Medecin : ${widget.nommedecin}",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 6, 6, 6),
                    fontStyle: FontStyle.italic,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            // TextField(
            //     controller: idmedecin,
            //     decoration: InputDecoration(
            //       filled: true,
            //       fillColor: Color.fromARGB(255, 235, 233, 233),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Color.fromARGB(255, 198, 196, 196),
            //         ),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       hintText: "${widget.idmedecin}",
            //       hintStyle: TextStyle(
            //         color: Color.fromARGB(255, 6, 6, 6),
            //         fontStyle: FontStyle.italic,
            //       ),
            //     )),
            // SizedBox(
            //   height: 10,
            // ),
            TextField(
                controller: nompatient,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 235, 233, 233),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 198, 196, 196),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Nom Patient :${widget.nompatient}",
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
                              idmedecin: widget.idmedecin,
                              nommedecin: widget.nommedecin)));
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
     // 'Date': time.text,
      'Date':date,
      'NomMedecin': widget.nommedecin,
      'Nompatient': widget.nompatient,
      'content': content.text,
      'NumMedecin': widget.idmedecin,
    })
        .then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending data to cloud firesstore'),
      ),
    );
  }
}


//   ref.add({
//     'NomMedecin': nommedecin.text,
//     'Date': time.text,
//     'Contenu': content.text,
//   }).whenComplete(() => Navigator.pop(context));
// },


//  FirebaseFirestore.instance.collection('dossiers').add({
//     'NomMedecin': nommedecin.text,
//     'Date': time.text,
//     'Contenu': content.text,
//   });