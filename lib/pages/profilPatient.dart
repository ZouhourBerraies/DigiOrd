import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/Create.dart';
import '../pages/patientCnx.dart';

class profile extends StatefulWidget {
  String idpatient;
  //String nompatient;

  profile({
    required this.idpatient,
    //required this.nompatient,
  });

  @override
  _profilestate createState() => _profilestate();
}

class _profilestate extends State<profile> {

  final Create user = Create (table: 'profileInfoPatient');
  late AsyncSnapshot<QuerySnapshot> snapshot;
  late DocumentSnapshot docToEdit;
  final profilepatientList =
  FirebaseFirestore.instance.collection('profileInfoPatient');

  TextEditingController nompatient = TextEditingController();
  TextEditingController prenompatient = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController motdepasse = TextEditingController();
  TextEditingController telephone = TextEditingController();
  int current = 0;
  @override
  void initState() {
    intialisation();
    super.initState();
  }

  Future<List?> getCurrentUserData() async {
    List infoPatient= [];
    try {
      DocumentSnapshot ds =
      await profilepatientList.doc(widget.idpatient).get();
      String firstname = ds.get('nom');
      String lastname = ds.get('prenom');
      String email = ds.get('email');
      String telephone = ds.get('telephone');
      String mdp = ds.get('password');

      infoPatient= [firstname, lastname, email, telephone, mdp];
      return infoPatient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  intialisation() async {
    dynamic result = await getCurrentUserData();
    if (result != null) {
      String nom = result[0];
      nompatient.text = nom;
      String prenom = result[1];
      prenompatient.text = prenom;
      String emailad = result[2];
      email.text = emailad;

      String tel = result[3];
      telephone.text = tel;
      String motdpass = result[4];
      motdepasse.text = motdpass;
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
          'Profile',
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => patient_cnx(
                      idpatient: widget.idpatient,
                      patient: nompatient.text+' '+prenompatient.text,
                    )));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
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
              controller: nompatient,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Nom',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Nom',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.perm_identity),
              ),
            ),
            TextField(
              controller: prenompatient,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Prénom',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Prénom',
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
                labelText: 'telephone',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre telephone',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
                icon: Icon(Icons.mobile_friendly_outlined),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ],
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
                            builder: (_) => patient_cnx(
                              idpatient: widget.idpatient,
                              patient: nompatient.text+' '+prenompatient.text,
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
                FlatButton(
                  onPressed: () {
                   user.UpdateUserPatient(widget.idpatient, nompatient.text, prenompatient.text, email.text, motdepasse.text, telephone.text,);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => patient_cnx(
                                idpatient: widget.idpatient,
                                patient: nompatient.text+" "+prenompatient.text,
                              )));

                  },
                  child: Text(
                    'Save',
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
