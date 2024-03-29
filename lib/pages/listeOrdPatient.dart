

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pcd/pages/patientCnx.dart';

import 'affichage.dart';




class afficheord extends StatefulWidget {
  //const gerer_ord({Key? key}) : super(key: key);
  String idpatient;
  String patient;
  afficheord({required this.idpatient,required this.patient});
  @override
  _afficheordState createState() => _afficheordState();
}


class _afficheordState extends State<afficheord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Les Ordonnances Médicales',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
      backgroundColor: Colors.indigo.shade300,
      leading:IconButton(
        icon:Icon(
          Icons.arrow_back,
          color:Colors.white,
        ),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (_) =>patient_cnx(
            idpatient: widget.idpatient,
            patient: widget.patient,
          )));
        },
      ),
        ),
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


                          onTap: ()async {
                             Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => affichage(
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





