// ignore_for_file: deprecated_member_use

//import 'dart:html';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../data/authentification.dart';
import 'AddNotes.dart';
import 'Editnote.dart';
import 'affichageNotes.dart';


class gerer_doss extends StatefulWidget {
  String idmedecin;
  String idpatient;
  String nommedecin;
  gerer_doss(
      {required this.idmedecin,
        required this.idpatient,
        required this.nommedecin});
  @override
  _gerer_dossState createState() => _gerer_dossState();
}

class _gerer_dossState extends State<gerer_doss> {

  final Authentication user= Authentication(table:'profileInfoPatient');
  String nompatient='###';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste des Dossiers medicals',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.cyan.shade700,
          actions: [
            RaisedButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              color: Colors.cyan.shade700,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.cyan.shade700,
          onPressed: () async{
            nompatient=await user.getUserData(widget.idpatient);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Addnote(
                      idpatient: widget.idpatient,
                      idmedecin: widget.idmedecin,
                      nommedecin: widget.nommedecin,
                      nompatient:nompatient
                    )));
          },
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("profileInfoPatient")
                  .doc(widget.idpatient)
                  .collection("Listedossiers")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> querySnapshot) {
                if (querySnapshot.hasError) return Text("Some Error");
                if (querySnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final list = querySnapshot.data!.docs;

                  final data = querySnapshot.requireData;
                  return list.isEmpty
                      ? const Center(
                    child: Text("Aucun Dossier "),
                  )
                      : ListView.builder(
                    itemCount: data.size,
                    itemBuilder: ((BuildContext context, int index) {
                      // list =
                      //     querySnapshot.data!.docs[index].data() as List?;
                      return Card(
                          color: Color.fromARGB(255, 235, 233, 233),
                          child: ListTile(
                            title: Text("Dossier $index "),
                            //selected: true,
                            leading: Icon(Icons.article_outlined),
                            subtitle:
                            Text('${data.docs[index]['NomMedecin']}'),

                            trailing: Text(formattedDate(data.docs[index]['Date']),),
                            onTap: () {
                              if (widget.idmedecin ==
                                  data.docs[index]['NumMedecin']) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditNote(
                                          docToEdit: querySnapshot.data!.docs[index],
                                          idpatient: widget.idpatient,
                                          idmedecin: widget.idmedecin,
                                          nommedecin: widget.nommedecin,
                                        )));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AffichageNote(
                                          docToEdit: querySnapshot
                                              .data!.docs[index],
                                          idpatient: widget.idpatient,
                                          idmedecin: widget.idmedecin,
                                          nommedecin:
                                          widget.nommedecin,
                                        )));
                              }
                            },
                          ));
                    }),

                    //  ListView.builder(
                    //     itemCount: DossiersList.length,
                    //     itemBuilder: (context, index) {
                    //       return Card(
                    //         color: Colors.grey[200],
                    //         child: ListTile(
                    //           title: Text("Dossier $index"),
                    //           // title: Text('${DossiersList[index]['NomMedecin']}'),
                    //           subtitle: Text('content'),
                    //           //  trailing: Text('${DossiersList[index]['content']}'),
                    //         ),
                    //       );
                    //     }),
                  );
                }
              }),
        ));
  }
  String formattedDate(timeStamp) {
    var dateFromTimeStamp =
    DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }

}
