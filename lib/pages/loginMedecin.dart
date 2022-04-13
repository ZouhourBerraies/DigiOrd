import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/acceuil.dart';

import 'inscriptionMedc.dart';
import 'medecinCnx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class medecin_login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _medecin_loginstate();
  }
}

class _medecin_loginstate extends State<medecin_login>{
  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cinController = TextEditingController();


  String password='0000';
  int cin=11111111;
  List itemsList=[];
  /* login */
  Widget buildAff(){
    final Stream <QuerySnapshot> users=FirebaseFirestore.instance.collection('profileInfoMedecin').snapshots();

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
  /* cin et mot de passe conforme */
  Future<dynamic> exist(cinn,mdp) async {
    dynamic t=false;
    for(var user in itemsList){
      if(cinn == user['cin'] && mdp == user['password']) {
        t = true;
        break;
      }

    }
    return t;
  }

  /*  ********** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(title: Text(
        'Zone Médecin',
        style:TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ), backgroundColor: Colors.cyan.shade700,


        automaticallyImplyLeading: false,
          actions: [
        RaisedButton(
    onPressed: () async {
      //await _auth.signOut().then((result) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => accueil()
                                            ));
     // });
    },
    child : Icon(
    Icons.exit_to_app,
    color: Colors.white,
      ),
      color: Colors.cyan.shade700,
    ),
          ],
      ),


      body: Center(
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Form(
            key: _formKey,
          child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child:Image(image:AssetImage('images/doctor.jpg'),
                       // width: 1000,
                       // height: 100,
                      ),
                    ),
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
                                    color: Colors.cyan.shade600,
                                  ),),
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller: _cinController,
                                  onChanged: (value){
                                    cin=int.parse(value);
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
                                      return 'Name cannot be empty';
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
                                RaisedButton(onPressed: () async{

                                  if (_formKey.currentState!.validate()) {
                                    dynamic test= await exist(cin,password);
                                    print(test);

                                    if (test==true) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('connecter'),
                                        ),
                                      );
                                      _cinController.clear();
                                      _passwordController.clear();

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => medecin_cnx()
                                          )
                                      );

                                    } else{
                                      print('cin incorrect or password incorrect');

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('cin incorrect or password incorrect'),
                                        ),
                                      );
                                    }
                                  }

                                }, child: Text('Se Connecter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                      FlatButton(onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Inscription()
                                            )
                                        );
                                      },
                                           child: Text('S\'inscrire',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                        //color: Colors.black45,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        textColor: Colors.cyan.shade600,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.cyan.shade600,)
                                    ]
                                ),
                                buildAff(),
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
        ),),
      ),
      bottomNavigationBar: new BottomNavigationBar(items:[
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
        fixedColor: Colors.cyan.shade600,
      ),
    );
  }
}