import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'ListeDossier.dart';

class EditNote extends StatefulWidget {
  String idmedecin;
  String idpatient;
  String nommedecin;
  DocumentSnapshot docToEdit;
  EditNote(
      {required this.docToEdit,
        required this.idmedecin,
        required this.idpatient,
        required this.nommedecin});

  // Map doss;
  // Databasedossier db;
  // EditNote({Key? key, required this.doss, required this.db}) : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController nompatient = TextEditingController();
  TextEditingController nommedecin = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController time = TextEditingController();
  //final AuthenticationDossier _auth = AuthenticationDossier();
  DateTime date = DateTime.now();
  // @override
  // void initState() {
  //   numpatient =
  //       TextEditingController(text: widget.docToEdit.data('Numpatient'));
  //   nommedecin =
  //       TextEditingController(text: widget.docToEdit.data('NumMedecin'));
  //   content = TextEditingController(text: widget.docToEdit.data('content'));
  //   time = TextEditingController(text: widget.docToEdit.data('Date'));
  //   super.initState();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print(widget.doss);
  //   nommedecin.text = widget.doss['NomMedecin'];
  //   numpatient.text = widget.doss['Numpatient'];
  //   time.text = widget.doss['Date'];
  //   content.text = widget.doss['content'];
  // }

  @override
  void initState() {
    nommedecin =
        TextEditingController(text: widget.docToEdit.get('NomMedecin'));
    nompatient =
        TextEditingController(text: widget.docToEdit.get('Nompatient'));
    //time = TextEditingController(text: widget.docToEdit.get('Date'));

    content = TextEditingController(text: widget.docToEdit.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

                  'Date : ${formattedDate(widget.docToEdit['Date'])}',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,

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
                    hintText: ('Nom Medecin : ${nommedecin.text}'))),
            SizedBox(
              height: 10,
            ),
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
                    hintText: ('Nom Patient : ${nompatient.text}'),

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
                      contentPadding: const EdgeInsets.all(20.0))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              // onPressed: () {
              //   widget.db.updatedossierList(nommedecin.text, numpatient.text,
              //       time.text, content.text);
              //   Navigator.pop(context, true);
              // },
                onPressed: () {
                  widget.docToEdit.reference.update({
                    'NomMedecin': nommedecin.text,
                    'Nomatient': nompatient.text,
                    'Date': date,
                    'content': content.text,
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => gerer_doss(
                              idpatient: widget.idpatient,
                              idmedecin: widget.idmedecin,
                              nommedecin: widget.nommedecin,
                            )));
                  });
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
  String formattedDate(timeStamp) {
    var dateFromTimeStamp =
    DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
}
