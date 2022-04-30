import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Authentication {
  String table;
  Authentication(
      {
        required this.table,
      });


  List itemsList=[];

  Widget buildAff(){

    final Stream <QuerySnapshot> users=FirebaseFirestore.instance.collection('$table').snapshots();

    return Container(
      height:250 ,
      padding: const EdgeInsets.symmetric(vertical:20),
      child:
      StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot>snapshot,
            ){
          if(snapshot.hasError)
          {
            return Text('Something went wrong.');
          }
          if (snapshot.connectionState==ConnectionState.waiting)
          {
            return Text( 'Loading');
          }
          final data=snapshot.requireData;
          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context,index)
            { itemsList.add(data.docs[index]);

            return
              //Text('');
              Text('cin= ${data.docs[index]['cin']} ++++|| ++++password= ${data.docs[index]['password']}');
            },
          );
        },

      ),

    );
  }


/* verification de mot de passe correct*/
  Future<dynamic> connecter (cinn,mdp) async {
    dynamic t=false;

    for(var user in itemsList){
      if(cinn == user['cin'] && mdp == user['password']) {
        t = true;

        break;
      }

    }
    return t;
  }

Future<String> getdonne(cinn,infor) async {
  String data="";
  for(var user in itemsList){
    if(cinn == user['cin']) {
      data=user[infor];
      break;
    }
  }
  return data;
}
  // Future<String> getPatient(String cinn) async {
  //   int cin=int.parse(cinn);
  //   String data="";
  //   for(var user in itemsList){
  //     if(cin == user['cin']) {
  //       data=user['nom'];
  //           //+' '+user['prenom'];
  //       break;
  //     }
  //   }
  //   return data;
  // }
  /* get information */

  final profileList = FirebaseFirestore.instance.collection('profileInfoPatient');

  Future<List?> getCurrentUserData(idpatient) async {
    List infoMedecin = [];
    try {
      DocumentSnapshot ds =
      await profileList.doc(idpatient).get();
      String firstname = ds.get('nom');
      String lastname = ds.get('prenom');
      String email = ds.get('email');
      String location = ds.get('location');
      String mdp = ds.get('password');
      String telp = ds.get('telephone').toString();


      infoMedecin = [firstname, lastname, email, location, mdp,telp];
      return infoMedecin;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<String> getUserData(idpatient) async {

      DocumentSnapshot ds =
      await profileList.doc(idpatient).get();
      String firstname = ds.get('nom');
      String lastname = ds.get('prenom');
      return firstname+" "+lastname;

  }
  Future<dynamic> getData(idpatient,information) async {

    DocumentSnapshot ds =
    await profileList.doc(idpatient).get();
    dynamic data = ds.get(information);

    return data;

  }

}