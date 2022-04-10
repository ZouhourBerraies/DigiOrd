
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'loginMedecin.dart';
import 'scanqr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
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
            color: Colors.cyan,
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
          MaterialPageRoute(builder: (context) => medecin_login()
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





class _InscriptionState extends State<Inscription> {
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoMedecin');
  final _formKey = GlobalKey<FormState>();

  TextEditingController _cinController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mdpcContoller = TextEditingController();
  TextEditingController _telController = TextEditingController();
  int cin=11111111;
  String  nom='';
  String  prenom='';
  String  email='';
  String password='0000';
  String mdpc='0000';
  int tel= 00000000;
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

              }
            },

            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.supervised_user_circle_outlined,
                    color:Colors.cyan),
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
                prefixIcon: Icon(Icons.face_outlined, color: Colors.cyan),
                hintText: 'Nom',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }

  Widget builPrenom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Prenom',
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
            controller: _prenomController,
            onChanged: (value){
              prenom=value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {

                return 'Entrez votre prenom !';
              } else
                return null;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.face_outlined,
                    color: Colors.cyan),
                hintText: 'Prenom',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }


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

                return 'Entrez votre email !';
              } else
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.cyan),
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
                Icon(Icons.mobile_screen_share, color:Colors.cyan),
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
                prefixIcon: Icon(Icons.lock, color:Colors.cyan),
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
                prefixIcon: Icon(Icons.lock, color: Colors.cyan),
                hintText: 'Confrimez Password',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }
/* s'inscrire firebase*/
  /*liste des identifiants */
  List itemsList = [];
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
            {
              itemsList.add(data.docs[index]['cin']);
              bool t=(cin==data.docs[index]['cin']);
              return Text('cin= ${data.docs[index]['cin']} ++++ ${t}++++${cin}');
              //Text('');
            },
          );
        },

      ),

    );
  }



/* recherche si in identifant existe déjà */
  Future<dynamic> exist(cinn) async {
    dynamic t=false;
    for(var user in itemsList){
      if(cinn==user){
        t= true;
        break;
      }
    }
    return t;
  }


  Widget buildInscritBtn() {

    return Container(

      child: RaisedButton(

        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic test= await exist(cin);
            print(test);

            if (test==false) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('inscription a été effectué avec succès.'),
                ),
              );
              profileList
                  .add({
                'cin': cin,
                'nom': nom,
                'prenom':prenom,

                'email':email,
                'telephone':tel,
                'password': password,
              }).then((value) => print('user added'))
                  .catchError((error) => print('erreur add user:$error'));
              _cinController.clear();
              _nomController.clear();
              _prenomController.clear();
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














/* ********************* */
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
                              Colors.cyan.shade700,
                              Colors.cyan.shade500,
                              Colors.cyan.shade300,
                              Colors.cyan.shade100,
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
                            builPrenom(),
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
                              height: 10,
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
                            buildAff(),
                          ],
                        ),
                      ),
                    ))
              ]))),
    );
  }
}
