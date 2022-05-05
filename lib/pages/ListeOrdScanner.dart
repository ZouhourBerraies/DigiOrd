

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pcd/data/authentification.dart';
import '../data/authentification.dart';


import 'affichageOrdScanner.dart';




class gerer_ord_phar extends StatefulWidget {

  String idpharmacie;
  gerer_ord_phar ({required this.idpharmacie});
  @override
  _gerer_ord_pharState createState() => _gerer_ord_pharState();
}

class _gerer_ord_pharState extends State<gerer_ord_phar> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Les ordonnances médicales Délivrés')),

        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
              FirebaseFirestore.instance.collection("profileInfoPharmacie").doc(widget.idpharmacie).collection("ListeOrdonnancePharmacie").snapshots(),
              builder: (BuildContext context,
                  //AsyncSnapshot<QuerySnapshot> querySnapshot
                  AsyncSnapshot<QuerySnapshot>snapshot ) {
                if (snapshot.hasError) return Text("Some Error");
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.requireData;

                  //final list = querySnapshot.data!.docs;
                  List list = snapshot.data!.docs;

                  return list.isEmpty
                      ? const Center(
                    child: Text("Aucun Ordonnance "),
                  )
                      : ListView.builder(
                    //itemCount: querySnapshot.data!.docs.length,
                    itemCount: data.size,
                    itemBuilder: (( context, index) {
                      return Card(
                        color: Color.fromARGB(255, 235, 233, 233),
                        child: ListTile(
                          title: Text("ordonnance  $index"
                              " (${data.docs[index]['nom patient']})"),
                          //title: Text("ordonnance ${data.docs[index]['numero']}"),

                          //selected: true,
                          leading: Icon(Icons.article_outlined),
                          subtitle: Text('${data.docs[index]['nom medecin']}'),
                          trailing: Text(formattedDate(data.docs[index]['date'])),

                          onTap: () {

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          affichage(
                                              index: data.docs[index],
                                              idpharmacie:widget.idpharmacie
                                          )
                                  )
                              );
                            }

                        ),
                      );
                    }),
                  );
                }
              }),
        ));
  }
}

String formattedDate(timeStamp) {
  var dateFromTimeStamp =
  DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
}



