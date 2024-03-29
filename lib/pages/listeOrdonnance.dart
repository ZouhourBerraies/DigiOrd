

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pcd/data/authentification.dart';
import 'package:pcd/pages/medecinGere.dart';
import '../data/authentification.dart';
import 'affichage.dart';
import 'affichageMedecin.dart';
import 'ordonnance.dart';



class gerer_ord extends StatefulWidget {

  String idmedecin;
  String idpatient;
  String doctor;
  //String patient;

  gerer_ord({required this.idmedecin,required this.idpatient,required this.doctor
    //,required this.patient
  });
  @override
  _gerer_ordState createState() => _gerer_ordState();
}

class _gerer_ordState extends State<gerer_ord> {

  final Authentication user= Authentication(table:'profileInfoPatient');
  String nompatient='###';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text('Les Ordonnances Médicales',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        backgroundColor: Colors.cyan.shade700,
        leading:IconButton(
          icon:Icon(
            Icons.arrow_back,
            color:Colors.white,
          ),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (_) =>medecin_gerer(
                idpatient: widget.idpatient,
                idmedecin: widget.idmedecin,
                doctor:widget.doctor,
            )));
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan.shade700,
        onPressed: ()async {
          nompatient=await user.getUserData(widget.idpatient);
          Navigator.push(context, MaterialPageRoute(builder: (_) =>Addord(
            idpatient: widget.idpatient,
              idmedecin: widget.idmedecin,
            doctor:widget.doctor,
            patient:nompatient
          )));
        },



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
                  child: Text("Aucun Dossier "),
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
                          if(widget.idmedecin==data.docs[index]['num medecin']) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        affichageMedecin(
                                            index: data.docs[index],
                                            idpatient: widget.idpatient
                                        )
                                )
                            );
                          }
                          else{
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        affichage(
                                            index: data.docs[index],
                                            idpatient: widget.idpatient
                                        )
                                )
                            );
                          }
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



