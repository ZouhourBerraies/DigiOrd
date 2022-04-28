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
/* get information */
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
  Future<String> getPatient(String cinn) async {
    int cin=int.parse(cinn);
    String data="";
    for(var user in itemsList){
      if(cin == user['cin']) {
        data=user['nom'];
            //+' '+user['prenom'];
        break;
      }
    }
    return data;
  }
}