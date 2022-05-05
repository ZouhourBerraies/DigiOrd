import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/Create.dart';
import '../data/authentification.dart';
import '../pages/pharmacieGere.dart';


class pharmacie_cnx extends StatefulWidget {
  String idpharmacie;
  pharmacie_cnx ({required this.idpharmacie});
  @override
  _pharmacie_cnxState createState() => _pharmacie_cnxState();
}





class _pharmacie_cnxState extends State<pharmacie_cnx> {
  final _formKey = GlobalKey<FormState>();
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoPatient');
  final Create user= Create(table:'profileInfoPatient');


  TextEditingController _cinController = TextEditingController();



  int cin=11111111;
  String id="";



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
            dynamic test= await user.exist(cin);
            print(test);

            if (test==true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Patient existe !'),
                ),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pharamcie_gere(idpatient:id,idpharmacie:widget.idpharmacie)
                  )
              );
              _cinController.clear();
            } else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Patient n\' existe pas '),
                ),
              );
            }


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
        title: Text('Zone Pharmacie'),
        backgroundColor: Colors.cyan.shade100,
        automaticallyImplyLeading: false,
        actions: [
          RaisedButton(
            onPressed: () async {

              Navigator.of(context).pop(true);
            },
            child : Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            color: Colors.cyan.shade100,
          ),
        ],
      ),


      body: Container(
        padding: EdgeInsets.all(0),
        // child: SingleChildScrollView(
        //   physics: AlwaysScrollableScrollPhysics(),
        //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child:Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image(image: AssetImage('images/pharamcieclient.jpg'),alignment: Alignment.center,),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0.5),

                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
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
                              height: 100,
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
                              child:user.buildAff(),
                            ),

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
      //  ),
      ),
      // bottomNavigationBar:
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
