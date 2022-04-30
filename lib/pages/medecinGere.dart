
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/Create.dart';
import '../data/authentification.dart';
import '../pages/ListeDossier.dart';
import '../pages/listeOrdonnance.dart';
import 'medecinCnx.dart';


class medecin_gerer extends StatefulWidget{
  @override
  String idmedecin;
  String idpatient;
  String doctor;
  //String patient;

  medecin_gerer({required this.idmedecin,required this.idpatient,required this.doctor
   // ,required this.patient
  });
  State<StatefulWidget> createState() {
    return new _medecin_gererState();
  }
}

class _medecin_gererState extends State<medecin_gerer> {
  void shownBottomSheet(){
    showModalBottomSheet(context: context, builder:( BuildContext context){
      return new Container(
        padding: EdgeInsets.all(22),
        child: new Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text('Veuillez Choisir l\'Un De Ses Bouttons Ci Dessus !',style: TextStyle(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 20)),
            new FlatButton(onPressed:()=>Navigator.pop(context), child: new Text('                  close',style: TextStyle(color: Colors.cyan.shade900,fontWeight: FontWeight.bold,fontSize: 16)))
          ],
        ),
      );
    },);
  }

  final Authentication user =Authentication (table:'profileInfoPatient');
  final _Key = GlobalKey<FormState>();

  final Create newuser= Create(table:'profileInfoPatient');

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  String nomp="?";
  String prenomp="?";
  String nompatient="####";



  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        

         backgroundColor: Colors.white,
          actions: [
        RaisedButton(
    onPressed: () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => medecin_cnx(
                idmedecin: widget.idmedecin,
                doctor: widget.doctor,
              )));
    },
    child : Icon(
    Icons.exit_to_app,
    color: Colors.white,
      ),
      color: Colors.cyan,
    ),
          ],
      ),
      body: Column(
        children: [
          new Container(
            height: 180,
            //width: width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),),
              color: Colors.cyan.shade100,
              //color: Colors.deepOrange.shade100,
            ),
            
            child: new Stack(
              children: [
                Positioned(
                  top:40,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),topRight:Radius.circular(50) ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    left: 35,
                    top: 80,
                    child: new Text("Espace Médecin",style: TextStyle(fontSize:35.0,color: Colors.cyan.shade700,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          SizedBox(height: height*0.05,),
          new Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top:20,
                  left: 23,
                  child: Material(
                    child: new Container(
                      height: 180,
                      width: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0) ,
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
                    elevation:10 ,
                    shadowColor:Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                    ),
                    child: new Container(
                      height: 180,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit:BoxFit.fill,
                            image: AssetImage("images/medGerer.jpg"),
                          )
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 45,
                    left: 500,
                    child:Container(
                      height: 450,
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DigiOrd est à votre service",style: TextStyle(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 25),),
                          Text("  Pret de gérer l'état du patient.",style: TextStyle(color: Colors.cyan.shade300,fontWeight: FontWeight.bold,fontSize: 22),),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            //indent: 20,
                            //endIndent: 0,
                            color: Colors.grey,
                          ),
                          Text("Avec DigiOrd, il n'est pas seulement possible d'écrire une ordonnance digitale mais aussi de gérer l'état de votre patient à distance et de partager toute information désirée avec les différents proffesionnels de santé .",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                          FlatButton(onPressed: shownBottomSheet, child: Text("Show Details?",style: TextStyle(color: Colors.cyan.shade700,fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.center,),),
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children:[
                  new Row(
                    children: [
                      new Container(
                        margin: const EdgeInsets.only(bottom: 10,top: 50),
                        width: 500,
                        padding: const EdgeInsets.only(left: 20,right: 10,bottom: 20),
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(80)) ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-10.0, 10.0), //(x,y)
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(left: 32,top: 50,bottom: 50
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new FlatButton(onPressed: ()
                              {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => gerer_doss(idmedecin: widget.idmedecin,idpatient:
                        widget.idpatient,nommedecin: widget.doctor,
                        )
                        )
                        );
                        },child: new Text('Gérer dossier médical',style: new TextStyle(fontSize:30.0,color: Colors.white,fontWeight: FontWeight.bold,
                              ),)),
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(bottom: 10,top: 50),
                        width: 500,
                        padding: const EdgeInsets.only(left: 20,right: 10,bottom: 20),
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(80)) ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-10.0, 10.0), //(x,y)
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(left: 32,top: 50,bottom: 50
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //new
                              FlatButton(
                                  onPressed: () async {
                                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => gerer_ord(
                            idpatient:widget.idpatient,
                            idmedecin:widget.idmedecin,
                            //patient:widget.patient,
                            //patient:nompatient,
                            doctor:widget.doctor)
                       )
                         );
                       String nom=await  user.getUserData(widget.idpatient);
                       print(nom);
                                 if (nom=='? ?'){
                                   openDialogueBox(context);
                                 }
                         },
                        child: new Text('Gérer Ordonnance',style: new TextStyle(fontSize:30.0,color: Colors.white,fontWeight: FontWeight.bold,
                              ),)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
            ),

          ),

        ],
      ),
      
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ajouter vos données'),
            content: Container(
              height: 300,
              child: Form(
                key: _Key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nom,
                      onChanged: (value) {
                        nomp = value;
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quel est la dose de medicament?';
                        } else
                          return null;
                      },
                      autocorrect: true,
                      autofocus: true,
                      maxLength: 30,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Nom',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Tapez Nom',

                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey
                        ),
                        icon: Icon(Icons.perm_identity),
                      ),
                    ),
                    TextFormField(
                      controller: prenom,
                      onChanged: (value) {
                        prenomp = value;
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quel est la dose de medicament?';
                        } else
                          return null;
                      },
                      autocorrect: true,
                      autofocus: true,
                      maxLength: 30,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Prénom',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Tapez Prénom',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey
                        ),
                        icon: Icon(Icons.perm_identity),
                      ),

                    ),

                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_Key.currentState!.validate()) {
                    submitAction(context);
                    Navigator.pop(context);
                  };
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    newuser.UpdateUserPatient(widget.idpatient, nomp, prenomp, '?', widget.idpatient,'?');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ajouter information nouveau patient'),
      ),
    );
    nom.clear();
    prenom.clear();

  }
}

