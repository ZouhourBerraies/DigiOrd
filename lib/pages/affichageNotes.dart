import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'dart:math';

import 'package:pcd/pages/ListeDossier.dart';

class AffichageNote extends StatefulWidget {
  String idmedecin;
  String idpatient;
  String nommedecin;
  DocumentSnapshot docToEdit;
  AffichageNote(
      {required this.docToEdit,
        required this.idmedecin,
        required this.idpatient,
        required this.nommedecin});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<AffichageNote> {
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
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Date: ${formattedDate(widget.docToEdit.get('Date'))}',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 222, 222, 221),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nom du medecin : ${widget.nommedecin}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 222, 222, 221),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Numero patient : ${widget.docToEdit.get('Nomatient')}',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 222, 222, 221),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Contenu : ${widget.docToEdit.get('content')}',
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => gerer_doss(
                              idpatient: widget.idpatient,
                              idmedecin: widget.idmedecin,
                              nommedecin: widget.nommedecin,
                            )));
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.indigo.shade300,
                ),
              ],
            ),
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
