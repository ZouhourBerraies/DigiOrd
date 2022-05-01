import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pcd/pages/acceuilPhrmacie.dart';
import '../data/Create.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';


class profile extends StatefulWidget {
  String idpharmacie;
  String pharmacie;

  profile({
    required this.idpharmacie,
    required this.pharmacie,

  });

  @override
  _profilestate createState() => _profilestate();
}

class _profilestate extends State<profile> {

  final Create user = Create (table: 'profileInfoPharmacie');

  late AsyncSnapshot<QuerySnapshot> snapshot;
  late DocumentSnapshot docToEdit;
  final profilepharmacieList =
  FirebaseFirestore.instance.collection('profileInfoPharmacie');

  TextEditingController nompharmacie = TextEditingController();
  TextEditingController prenompharmacie = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController motdepasse = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController telephone = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? image;


  int current = 0;
  @override
  void initState() {
    intialisation();
    super.initState();
  }

  Future<List?> getCurrentUserData() async {
    List infopharmacie = [];
    try {
      DocumentSnapshot ds =
      await profilepharmacieList.doc(widget.idpharmacie).get();
      String firstname = ds.get('nom');

      String email = ds.get('email');
      String location = ds.get('location');
      String mdp = ds.get('password');
      String telp = ds.get('telephone').toString();


      infopharmacie = [firstname, email, location, mdp,telp];
      return infopharmacie;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  intialisation() async {
    dynamic result = await getCurrentUserData();
    if (result != null) {
      String nom = result[0];
      nompharmacie.text = nom;
      String emailad = result[1];
      email.text = emailad;
      String loc = result[2];
      location.text = loc;
      String motdpass = result[3];
      motdepasse.text = motdpass;
      String tel = result[4];
      telephone.text = tel;

    }
  }

  //handle indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan.shade700,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => accueilPhar(
                      idpharmacie: widget.idpharmacie,
                      pharmacie: widget.pharmacie,

                    )));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              'Modifier Votre Profil',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            // SizedBox(
            //   height: 16,
            // ),
            // imageProfile(),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/edit.jpg"),
                        )),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                Theme.of(context).scaffoldBackgroundColor),
                            shape: BoxShape.circle,
                            color: Colors.indigo.shade50),
                        child: Icon(
                          Icons.edit,
                          color: Colors.blueGrey.shade700,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: nompharmacie,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Nom',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez  Nom de pharmacie' ,
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.perm_identity),
              ),
            ),

            TextField(
              controller: motdepasse,
              obscureText: true,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                //suffixIcon: isPasswordTextField ? IconButton(onPressed: onPressed:(){}, icon: Icon(icons.rem)),
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Mot De Passe',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre MDP',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              controller: email,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Email',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              controller: telephone,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Telephone',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Numero Telephone',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.mobile_friendly_outlined),
              ),
            ),
            TextField(
              controller: location,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Location',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Location',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.location_on_outlined),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => accueilPhar(
                              idpharmacie: widget.idpharmacie,
                              pharmacie: widget.pharmacie,

                            )));
                  },
                  child: Text(
                    'Annuler',
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
                FlatButton(
                  onPressed: () {
                    user.UpdateUser(widget.idpharmacie, nompharmacie.text, 'Pharmacie:', email.text, motdepasse.text, telephone.text, location.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => accueilPhar(
                              idpharmacie: widget.idpharmacie,
                              pharmacie: widget.pharmacie,

                            )));

                  },
                  child: Text(
                    'Sauvegarder',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.indigo.shade300,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
