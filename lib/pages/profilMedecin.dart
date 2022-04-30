import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/Create.dart';
import '../pages/medecinCnx.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/src/services/message_codec.dart';

class profile extends StatefulWidget {
  String idmedecin;
  String nommedecin;

  profile({
    required this.idmedecin,
    required this.nommedecin,
  });

  @override
  _profilestate createState() => _profilestate();
}

class _profilestate extends State<profile> {

  final Create user = Create (table: 'profileInfoMedecin');

  late AsyncSnapshot<QuerySnapshot> snapshot;
  late DocumentSnapshot docToEdit;
  final profileMedecinList =
  FirebaseFirestore.instance.collection('profileInfoMedecin');

  TextEditingController nommedecin = TextEditingController();
  TextEditingController prenommedecin = TextEditingController();
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
    List infoMedecin = [];
    try {
      DocumentSnapshot ds =
      await profileMedecinList.doc(widget.idmedecin).get();
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

  intialisation() async {
    dynamic result = await getCurrentUserData();
    if (result != null) {
      String nom = result[0];
      nommedecin.text = nom;
      String prenom = result[1];
      prenommedecin.text = prenom;
      String emailad = result[2];
      email.text = emailad;
      String loc = result[3];
      location.text = loc;
      String motdpass = result[4];
      motdepasse.text = motdpass;
      String tel = result[5];
      location.text = tel;

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

//   Widget imageProfile() {
//     return Center(
//       child: Stack(children: <Widget>[
//         // CircleAvatar(
//         //   radius: 80.0,
//         //   backgroundColor: Colors.white,
//         //    backgroundImage:
//
//
//       image != null
//             ? Image(image: FileImage(image!, scale: 4))
//             : Image.asset(
//           "images/prof.jpg",
//           width: 120.0,
//           height: 120.0,
//           fit: BoxFit.cover,
//         ),
//
//         //   ,
//         // : FlutterLogo(size: 160),
//
// //  if ( _imageFile == null) {
// //    Image.asset("images/prof.jpg")
// //  } else {
// //    FileImage(File(_imageFile.path));
// //  }
//
//         Positioned(
//           bottom: 20.0,
//           right: 20.0,
//           child: InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: ((builder) => bottomSheet()),
//               );
//             },
//             child: Icon(
//               Icons.camera_alt,
//               color: Colors.teal,
//               size: 28.0,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
//   Widget bottomSheet() {
//     return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choose Profile photo",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 pickImage(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 pickImage(ImageSource.gallery);
//               },
//               label: Text("Gallery"),
//             ),
//           ])
//         ],
//       ),
//     );
//   }
//
//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() => this.image = imageTemporary);
//     } on PlatformException catch (e) {
//       print('failed to pick image $e');
//     }
//   }
//

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
                    builder: (_) => medecin_cnx(
                      idmedecin: widget.idmedecin,
                      doctor: widget.nommedecin,
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
              controller: nommedecin,
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
              controller: prenommedecin,
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
                            builder: (_) => medecin_cnx(
                              idmedecin: widget.idmedecin,
                              doctor: widget.nommedecin,
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
                 user.UpdateUser(widget.idmedecin, nommedecin.text, prenommedecin.text, email.text, motdepasse.text, telephone.text, location.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => medecin_cnx(
                                idmedecin: widget.idmedecin,
                                doctor: widget.nommedecin,
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
