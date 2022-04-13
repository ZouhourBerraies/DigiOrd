import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'medecinGere.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class medecin_cnx extends StatefulWidget {
  @override
  _medecin_cnxState createState() => _medecin_cnxState();
}





class _medecin_cnxState extends State<medecin_cnx> {
  final _formKey = GlobalKey<FormState>();
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoPatient');


  TextEditingController _cinController = TextEditingController();



  int cin=11111111;



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


  List itemsList=[];





  /* login */
  Widget buildAff(){
    final Stream <QuerySnapshot> users=FirebaseFirestore.instance.collection('profileInfoPatient').snapshots();

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
            { itemsList.add(data.docs[index]['cin']);
            return
              //Text('');
              Text('cin= ${data.docs[index]['cin']} ');
            },
          );
        },

      ),

    );
  }
  /* rechercher patient */
  Future<dynamic> exist(cinn) async {
    dynamic t=false;
    for(var user in itemsList){
      if(cinn == user) {
        t = true;
        break;
      }
    }
    return t;
  }
  Widget buildOkBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          if (_formKey.currentState!.validate()) {
            dynamic test= await exist(cin);
            print(test);

            if (test==false) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ajouter nouveau patient'),
                ),
              );
              profileList
                  .add({
                'cin': cin,
                'nom': '',
                'prenom':'',
                'email':'',
                'telephone':'',
                'password': cin.toString(),
              }).then((value) => print('user added'))
                  .catchError((error) => print('erreur add user:$error'));
              _cinController.clear();
            } else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Patient existe déjà'),
                ),
              );
            }
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => medecin_gerer()
                )
            );

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
              //await _auth.signOut().then((result) {
              Navigator.of(context).pop(true);
              // });
            },
            child : Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            color: Colors.cyan,
          ),
        ],
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
                          buildAff(),
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
        fixedColor: Colors.cyan.shade700,
      ),
    );
  }
}
