import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginMedecin.dart';
import 'loginPharmacie.dart';
import 'loginPatient.dart';

class accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _accueilState();
  }
}

class _accueilState extends State<accueil> {
  void shownBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          padding: EdgeInsets.all(22),
          child: new Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text('Veuillez Choisir l\'Un De Ses Bouttons Ci Dessus !',
                  style: TextStyle(
                      color: Colors.cyan.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('                  close',
                      style: TextStyle(
                          color: Colors.cyan.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          new Container(
            height: 180,
            //width: width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Colors.cyan.shade100,
              //color: Colors.deepOrange.shade100,
            ),
            child: new Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    left: 35,
                    top: 80,
                    child: new Text(
                      "Le Monde DigiOrd",
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.cyan.shade700,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          new Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 23,
                  child: Material(
                    child: new Container(
                      height: 180,
                      width: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0), //(x,y)
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: new Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: new Container(
                      height: 180,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/accueil.jpg"),
                          )),
                    ),
                  ),
                ),
                Positioned(
                    top: 45,
                    left: 500,
                    child: Container(
                      height: 400,
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenue Chez Le Monde DigiOrd",
                            style: TextStyle(
                                color: Colors.cyan.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            "   Ne Perdez Plus Votre Ordonnance.",
                            style: TextStyle(
                                color: Colors.cyan.shade300,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            //indent: 20,
                            //endIndent: 0,
                            color: Colors.grey,
                          ),
                          Text(
                            "Avec DigiOrd, perdre une ordonnance n'est plus un problème. Tout ce que vous écrivez est enregistré et synchronisé sur tous vos appareils.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          FlatButton(
                            onPressed: shownBottomSheet,
                            child: Text(
                              "Show Details?",
                              style: TextStyle(
                                  color: Colors.cyan.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              new Row(
                children: [
                  new Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 50),
                    width: 500,
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0), //(x,y)
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding:
                          const EdgeInsets.only(left: 32, top: 50, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new FlatButton(
                           
                              onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => medecin_login()
            )
            );
        },
                              child: new Text(
                                'Médecin',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 50),
                    width: 500,
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0), //(x,y)
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding:
                          const EdgeInsets.only(left: 32, top: 50, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new FlatButton(
                              onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => pharmacie_login()
            )
            );
        },
                              child: new Text(
                                'Pharmacien',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 50),
                    width: 500,
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0), //(x,y)
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding:
                          const EdgeInsets.only(left: 32, top: 50, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new FlatButton(
                              onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => patient_login()
            )
            );
        },
                              child: new Text(
                                'Patient',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
