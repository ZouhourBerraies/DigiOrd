
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcd/pages/profilMedecin.dart';

import 'acceuil.dart';
import 'medecinGere.dart';

import '../data/Create.dart';
import '../data/authentification.dart';
import 'profilMedecin.dart';


class medecin_cnx extends StatefulWidget {
  @override
  String idmedecin;
  String doctor;
  medecin_cnx({required this.idmedecin,required this.doctor});
  _medecin_cnxState createState() => _medecin_cnxState();
}





class _medecin_cnxState extends State<medecin_cnx> {
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<FormState>();

  //final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoPatient');

  final Create newuser= Create(table:'profileInfoPatient');
  final Authentication login= Authentication(table:'profileInfoPatient');

  TextEditingController _cinController = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();


  int cin=11111111;
  String id='';
  String nompatient="?";
  String prenompatient="?";
  String patient="//";



  Widget builNumero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Entrez Numéro de Patient',
          style: TextStyle(
              color: Colors.cyan.shade200, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.cyan.shade50,
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
                prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: Colors.cyan.shade200),
                hintText: 'Numéro Patient',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }









  Widget buildOkBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          if (_formKey.currentState!.validate()) {
           // patient="M."+"${await login.getdonne(cin,'nom')}"+" "+"${await login.getdonne(cin,'prenom')}";
            //patient=await login.getUserData(id);
            dynamic test= await newuser.exist(cin);
            if (test==false) {
             newuser.CreateUserPatient(id, cin, nompatient, prenompatient, '?', 0, cin.toString(),'?');
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                 content: Text('Ajouter nouveau patient'),
               ),
             );
            } else {
              patient=await login.getUserData(id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Patient existe déjà $patient'),
                ),
              );
            }
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => medecin_gerer(
                      idpatient:id,idmedecin:widget.idmedecin,doctor:widget.doctor,
                      //patient:patient
                    )
                  )
              );

            _cinController.clear();


          }
        },

        padding: EdgeInsets.all(20.0),
        shape:
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.cyan.shade300,
        child: Text(
          'OK',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );
  }


  /* ************************ */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Zone Médecin'),
        backgroundColor: Colors.cyan.shade700,

        actions: [
          RaisedButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => accueil()));
            },
            child : Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            color: Colors.cyan.shade700,
          ),
        ],
      ),
      drawer:  Drawer(
        child: ListView(
            children: [
              DrawerHeader(
                //   child: CircleAvatar(
                //   child: Image.asset('images/doctor.jpg'),
                // ),
                child:Column(
                    children: [
                      Container(

                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.5),
                                //offset: Offset(0, 1)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/profilmedecin.png"),
                            )),
                      ),
                      Text('${widget.doctor}',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ]
                ),


              ),
              ListTile(
                title: Text(
                  'Profil',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.black26,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => profile(idmedecin:widget.idmedecin,nommedecin: widget.doctor,)
                    ),
                  );
                },
              ),
            ]
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
    child: SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
    child:Form(
    key: _formKey,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image(image: AssetImage('images/ord.jpg')),
              ),
              Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(50),



                      child: Column(
                        children: [
                          Text(
                            'Bienvenue Chez DigiOrd ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan.shade600,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          builNumero(),
                          SizedBox(
                            height: 30,
                          ),
                          buildOkBtn(context),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 10,
                            child:newuser.buildAff(),
                          ),
                          //newuser.buildAff(),

                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    ),
      ),
      //  bottomNavigationBar:
      // new BottomNavigationBar(items:[
      //   new BottomNavigationBarItem(icon: new Icon(Icons.add_a_photo),
      //     label:'PHOTO TIME',
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.ac_unit_rounded),
      //     label:'WINTER',
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.wifi_sharp),
      //     label:'WIFI',
      //   ),
      //   new BottomNavigationBarItem(icon: new Icon(Icons.add_ic_call_outlined),
      //     label:'PHONE CALL',
      //   )
      // ],
      //   onTap: (int x)=>debugPrint('index $x'),
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: Colors.cyan.shade700,
      // ),
    );
  }


}

