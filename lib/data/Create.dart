import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Create {
  String table;

  Create({
    required this.table,
  });
  List itemsList = [];
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
            {
              itemsList.add(data.docs[index]['cin']);

              return Text('cin= ${data.docs[index]['cin']}');
              //Text('');
            },
          );
        },

      ),

    );
  }



/* recherche si un identifant existe déjà */
  Future<dynamic> exist(cinn) async {
    dynamic t=false;
    for(var user in itemsList){
      if(cinn==user){
        t= true;
        break;
      }
    }
    return t;
  }
  Future<void> CreateUser(String id,int cin,String nom,String prenom,String email,int tel,String password) async{
    final CollectionReference profileList = FirebaseFirestore.instance.collection(table);
    dynamic test = await exist(cin);
    if (test == false) {
     return await  profileList.doc(id)
          .set({
        'cin': cin,
        'nom': nom,
        'prenom': prenom,
        'location': '',
        'email': email,
        'telephone': tel,
        'password': password,
       'location':"",
      }).then((value) => print('user added'))
          .catchError((error) => print('erreur add user:$error'));
    }
  }
  Future<void> CreateUserPatient(String id,int cin,String nom,String prenom,String email,int tel,String password,String genre) async {
    final CollectionReference profileList = FirebaseFirestore.instance
        .collection(table);
    dynamic test = await exist(cin);
    if (test == false) {
      return await profileList.doc(id)
          .set({
        'cin': cin,
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'telephone': tel,
        'password': password,
        'genre': genre
      }).then((value) => print('user added'))
          .catchError((error) => print('erreur add user:$error'));
    }
  }

  Future<void> UpdateUserInsc(String id,String nom,String prenom,String email,String motpasse,String telephone, String dropdownValue) async{
    final CollectionReference profileList = FirebaseFirestore.instance.collection(table);
      return await  profileList.doc(id)
          .update({
        'nom': nom,
        'prenom':prenom,
        'email':email,
        'password': motpasse,
        'telephone':telephone,
        'genre':dropdownValue,

      });
    }
  Future<void> UpdateUserPatient(String id,String nom,String prenom,String email,String motpasse,String telephone ) async{
    final CollectionReference profileList = FirebaseFirestore.instance.collection(table);
    return await  profileList.doc(id)
        .update({
      'nom': nom,
      'prenom':prenom,
      'email':email,
      'password': motpasse,
      'telephone':telephone,


    });
  }
  Future<void> UpdateUser(String id,String nom,String prenom,String email,String motpasse,String telephone ,String location) async{
    final CollectionReference profileList = FirebaseFirestore.instance.collection(table);
    return await  profileList.doc(id)
        .update({
      'nom': nom,
      'prenom':prenom,
      'email':email,
      'password': motpasse,
      'telephone':telephone,
      'location':location

    });
  }
  }