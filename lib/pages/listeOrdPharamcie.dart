

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'affichagePharmacie.dart';




class afficheord extends StatefulWidget {
  //const gerer_ord({Key? key}) : super(key: key);
  String idpatient;
  String idpharmacie;

  afficheord({required this.idpatient,required this.idpharmacie});
  @override
  _afficheordState createState() => _afficheordState();
}


class _afficheordState extends State<afficheord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Les ordonnances médicales'),
          backgroundColor: Colors.cyan.shade100,)
        ,

        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
              FirebaseFirestore.instance.collection("profileInfoPatient").doc(widget.idpatient).collection("ListeOrdonnance").snapshots(),
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
                          //title: Text("ordonnance $index"),
                          title: Text("ordonnance ${data.docs[index]['numero']}"),

                          //selected: true,
                          leading: Icon(Icons.article_outlined),
                          subtitle: Text('${data.docs[index]['nom medecin']}'),
                          trailing: Text(formattedDate(data.docs[index]['date'])),



                          onTap: () {
                             Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => affichagePharmacie(
                                    //docToEdit: querySnapshot.data!.docs[index]
                                    idpharmacie: widget.idpharmacie,
                                      index:data.docs[index],
                                      idpatient:widget.idpatient
                                  )
                              )
                          );
                          },
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






