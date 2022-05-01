import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcd/pages/profilePatientInsc.dart';

import '../pages/inscriptionPatient.dart';
import 'acceuil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'patientCnx.dart';
import '../data/authentification.dart';

class patient_login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _patient_loginstate();
  }
}

class _patient_loginstate extends State<patient_login>{

  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cinController = TextEditingController();


  String password='0000';
  int cin=11111111;
  String id="";

  final Authentication login= Authentication(table:'profileInfoPatient');

  /* **********  */
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(
        'Zone Patient',
        
        style:TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ), backgroundColor: Colors.indigo.shade300,
      automaticallyImplyLeading: false,
          actions: [
        RaisedButton(
    onPressed: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => accueil()
                                            ));
    },
    child : Icon(
    Icons.exit_to_app,
    color: Colors.white,
      ),
      color: Colors.indigo.shade300,
    ),
          ],
      ),

      body: Center(
        child: Container(
          //margin:  EdgeInsets.all(0.05),
          padding: EdgeInsets.all(50.0),

          decoration: BoxDecoration(
          ),
          //width: 1000, height: 1000,
    child: SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
    child:Form(

    key: _formKey,
          child:Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child:Image(image:AssetImage('images/patient.jpg')),),
                    Expanded(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget> [
                          Container(
                            padding: EdgeInsets.all(70.0),
                            child:Column(
                              children: [
                                Text(
                                  'Bienvenue Chez DigiOrd ',
                                  textAlign: TextAlign.center,
                                  style:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo.shade300,
                                  ),),
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller: _cinController,
                                  onChanged: (value){
                                    cin=int.parse(value);
                                    id=value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {

                                      return 'cin cannot be empty';
                                    } else
                                      return null;
                                  },
                                  autocorrect: true,
                                  autofocus: true,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    // ),
                                    icon: Icon(Icons.perm_identity),
                                    hintText: 'Tapez Votre ID',
                                    labelText: 'USER ID',
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  onChanged: (value){
                                    password=value;
                                  },

                                  validator: (value) {
                                    if (value== null || value.isEmpty) {
                                      return 'Password cannot be empty';
                                    } else
                                      return null;
                                  },
                                  autocorrect: true,
                                  autofocus: true,
                                  obscureText: true,
                                  maxLength: 20,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white60,
                                    filled: true,
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    // ),
                                    icon: Icon(Icons.lock),
                                    hintText: 'Tapez Votre MDP',
                                    labelText: 'USER PASSWORD',
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RaisedButton(
                                  onPressed :() async {
                                if (_formKey.currentState!.validate()) {
                                dynamic test= await login.connecter(cin,password);
                                if (test==true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                content: Text('Connecter'),
                                ),
                                );
                                _cinController.clear();
                                _passwordController.clear();
                                String nom= await login.getUserData(id);
                                dynamic genre=await login.getData(id,'genre');
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => patient_cnx(idpatient:id,patient:nom,
                               )
                                )
                                );

                                if (nom=='? ?' || genre=="-----")  {
                                  openDialogueBox(context);
                                }

                                } else{
                                print('cin incorrect or password incorrect');

                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                content: Text('cin incorrect or password incorrect'),
                                ),
                                );
                                }
                                }

                                },


                                  child: Text('Se Connecter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  color: Colors.black45,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(20.0),

                                  splashColor: Colors.black45,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:<Widget> [
                                      new Text('Vous N\'avez Pas De Compte?      ',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black45  ),),
                                      FlatButton(onPressed:(){
                                        Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>Inscription()
                                      )
                                  );
                                      }
                                      , child: Text('S\'inscrire',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                        //color: Colors.black45,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        textColor: Colors.indigo.shade300,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.indigo.shade300,)
                                    ]
                                ),
                                login.buildAff(),

                              ],
                            ),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ]
          ),
    ),
        ),
        ),
      ),
      bottomNavigationBar:
      new BottomNavigationBar(items:[
        new BottomNavigationBarItem(icon: new Icon(Icons.add_a_photo),
          label:'PHOTO TIME',
        ),
        new BottomNavigationBarItem(icon: new Icon(Icons.ac_unit_rounded),
          label:'WINTER',
        ),
        new BottomNavigationBarItem(icon: new Icon(Icons.wifi_sharp),
          label:'WIFI',
        ),
        new BottomNavigationBarItem(icon: new Icon(Icons.add_ic_call_outlined),
          label:'PHONE CALL',
        )
      ],
        onTap: (int x)=>debugPrint('index $x'),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.indigo.shade300,
      ),
    );
  }
  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('entrer vos informations'),

            actions: [
              FlatButton(
                onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => profile(idpatient: id)
                )
            );
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
}