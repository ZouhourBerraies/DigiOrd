
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'loginPharmacie.dart';
import 'scanqr.dart';
import '../data/Create.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}








class _InscriptionState extends State<Inscription> {

  final Create newuser= Create(table:'profileInfoPharmacie');

  final _formKey = GlobalKey<FormState>();

  TextEditingController _cinController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mdpcContoller = TextEditingController();
  TextEditingController _telController = TextEditingController();
  int cin=11111111;
  String  nom='';
  String  email='';
  String password='0000';
  String mdpc='0000';
  int tel= 00000000;

  String id ='X';
  Widget builCin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Numéro d\' inscription',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _cinController,
            validator: (value) {
              int l=value.toString().length;
              if (value== null || value.isEmpty) {
                return 'Entrez votre numéro de carte d\'identité ! ';
              } else {
                if (l != 8) {
                  return 'cin not valide';
                }else
                  //return null;
                  cin=int.parse(value);
                id=value;

              }
            },

            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.supervised_user_circle_outlined,
                    color:Colors.blue.shade300),
                hintText: 'CIN',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  Widget builNom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nom',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _nomController,
            onChanged: (value){
              nom=value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {

                return 'Entrez votre nom !';
              } else
                return null;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.face_outlined, color: Colors.blue.shade300),
                hintText: 'Nom',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  // Widget builPrenom() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         'Prenom',
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
  //             ]),
  //         height: 60,
  //         child: TextFormField(
  //           controller: _prenomController,
  //           onChanged: (value){
  //             prenom=value;
  //           },
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //
  //               return 'Entrez votre prenom !';
  //             } else
  //               return null;
  //           },
  //           keyboardType: TextInputType.name,
  //           style: TextStyle(color: Colors.black),
  //           decoration: InputDecoration(
  //               border: InputBorder.none,
  //               contentPadding: EdgeInsets.only(top: 14),
  //               prefixIcon: Icon(Icons.face_outlined,
  //                   color: Colors.blue.shade300),
  //               hintText: 'Prenom',
  //               hintStyle: TextStyle(color: Colors.black26)),
  //         ),
  //       )
  //     ],
  //   );
  // }
  //

  Widget buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _emailContoller,
            onChanged: (value){
              email=value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {

                return 'Entrez votre emil !';
              } else
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.blue.shade300),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  Widget buildTelephone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Numéro téléphone',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _telController,
            onChanged: (value){
              tel=int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {

                return 'Entrez votre numéro de téléphone !';
              } else
                return null;
            },
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon:
                Icon(Icons.mobile_screen_share, color:Colors.blue.shade300),
                hintText: 'Numéro téléphone',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  Widget buildpassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'PassWord',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _passwordController,
            onChanged: (value){
              password=value;
            },
            obscureText: true,
            validator: (value) {
              if (value== null || value.isEmpty) {
                return 'Entrez votre password !';
              } else
                return null;
            },

            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color:Colors.blue.shade300),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  Widget buildConfirmpassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmez PassWord',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(

            controller: _mdpcContoller,
            obscureText: true,
            onChanged: (value){
              mdpc=value;
            },
            validator: (value) {
              if (value==null || value.isEmpty) {
                return 'confirmez votre mode de passe';
              } else {
                if (password!=mdpc) {
                  _mdpcContoller.clear();
                  return 'mot de passe incorrect ';
                }
                else
                  return null;
              }
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.blue.shade300),
                hintText: 'Confrimez Password',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }
  Widget builddiplome(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => QRScanPage(),)),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Scan QR Code',

          style: TextStyle(
              color: Colors.blue.shade300,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  Widget buildRetourBtn(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pharmacie_login()
            )
        );
      },
      //onTap: () => print("retour login"),
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Avez-vous déjà un compte ?',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
            TextSpan(
                text: 'S\'identifier',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold))
          ])),
    );
  }


  Widget buildInscritBtn() {

    return Container(

      child: RaisedButton(

        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic test= await newuser.exist(cin);

            if (test==false) {
              newuser.CreateUser(id, cin, nom,'Pharmacie :', email, tel, password);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('inscription a été effectué avec succès.'),
                ),
              );
              _cinController.clear();
              _nomController.clear();
              _emailContoller.clear();
              _passwordController.clear();
              _mdpcContoller.clear();
              _telController.clear();

              //Navigator.pop(context);

            } else{
              print('cin existe ');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('l\'utilisateur existe déjà'),
                ),
              );
            }

          }
        },

        color: Colors.black45,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: StadiumBorder(),
        //color: Colors.white,
        child: Text(
          'S\'inscrire',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

/* ************ */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(children: <Widget>[
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade400,
                              Colors.blue.shade300,
                              Colors.blue.shade200,
                              Colors.blue.shade100,
                            ])),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child:Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/Ajouter.png',
                                height: 70.0, width: 50.0),
                            Center(
                              child: Text(
                                'Créer un compte',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            builCin(),
                            SizedBox(
                              height: 20,
                            ),
                            builNom(),
                            SizedBox(
                              height: 20,
                            ),
                            buildemail(),
                            SizedBox(
                              height: 20,
                            ),
                            buildTelephone(),
                            SizedBox(
                              height: 20,
                            ),
                            buildpassword(),
                            SizedBox(
                              height: 20,
                            ),
                            buildConfirmpassword(),
                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                child:
                                Text(
                                  'Entrez Votre Diplome',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),),
                            ),
                            builddiplome(context),
                            SizedBox(
                              height: 20,
                            ),
                            buildInscritBtn(),
                            SizedBox(
                              height: 20,
                            ),
                            buildRetourBtn(context),
                            SizedBox(
                              height: 20,
                            ),
                            //newuser.buildAff(),
                          ],
                        ),
                      ),
                    ))
              ]))),
    );
  }
}
