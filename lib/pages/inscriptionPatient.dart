
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'loginPatient.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}
class genreModel{
  final String id;
  final String name;
  genreModel({
    required this.id,
    required this.name,
  });
}


class _InscriptionState extends State<Inscription> {
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoPatient');
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
  //late genreModel  genre;
  String genre='';
  String  email='';
  String password='0000';
  String mdpc='0000';
  int tel= 00000000;
  String id='X';
  List genretype = ['-----', 'Homme', 'Femme'];

  String dropdownValue = "-----";

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
                    color:Colors.indigo.shade300),
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
                prefixIcon: Icon(Icons.face_outlined, color: Colors.indigo.shade300),
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
                    color: Colors.indigo.shade300),
                hintText: 'Prenom',
                hintStyle: TextStyle(color: Colors.black26)),
          ),
        )
      ],
    );
  }
  /*Widget buildgenre() {
    final List<genreModel> _genreModels = [
      genreModel( id:'0',name:"Homme"),
      genreModel(id:'1',name:"Femme"),
    ];

    List<genreModel> selectedGenre=[];
    final _items = _genreModels
        .map((item) => MultiSelectItem<genreModel>(item, item.name))
        .toList();
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        //padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 10),
            //################################################################################################
            // Rounded blue MultiSelectDialogField
            //################################################################################################
            MultiSelectDialogField(
              items: _items,
              title: Text("Genre"),
              selectedColor: Colors.indigo.shade300,
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),

              buttonText: Text(
                "Selectionnez votre genre",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                ),
              ),
              buttonIcon: Icon(
                Icons.face_retouching_natural_sharp,
                color: Colors.indigo.shade300,
              ),
              onConfirm: (results) {
                //_selectedAnimals = results;
                //genre=results as genreModel;
                genre=results as String ;
              },

            ),
          ],
        ),
      ),
    );

  }*/
  Widget buildgenre() {

    return Container(

        padding: EdgeInsets.only(left: 16.0, right: 16.0),

        decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(10),

            boxShadow: [

              BoxShadow(

                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))

            ]),

        child: DropdownButton(

          hint: Text('Select Genre'),

          dropdownColor: Color.fromARGB(255, 246, 242, 242),

          elevation: 5,

          icon: Icon(Icons.arrow_drop_down),

          iconSize: 36,

          isExpanded: true,

          value: dropdownValue,

          style: TextStyle(color: Colors.black, fontSize: 16),

          onChanged: (value) {

            setState(() {

              dropdownValue = value as String;

            });

          },

          items: genretype.map((value) {

            return DropdownMenuItem(

              value: value,

              child: Text(value),

            );

          }).toList(),

        ));

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

                return 'Entrez votre emil !';
              } else
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.indigo.shade300),
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
                Icon(Icons.mobile_screen_share, color:Colors.indigo.shade300),
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
                prefixIcon: Icon(Icons.lock, color:Colors.indigo.shade300),
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
                prefixIcon: Icon(Icons.lock, color: Colors.indigo.shade300),
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
          profileList.doc(id)
              .set({
            'cin': cin,
            'nom': nom,
            'prenom':prenom,
            'genre': dropdownValue,
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

  Widget buildRetourBtn(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => patient_login ()
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















// *************************************/
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
                              Colors.indigo.shade400,
                              Colors.indigo.shade300,
                              Colors.indigo.shade200,
                              Colors.indigo.shade100,
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
                          SizedBox(
                            width: double.infinity,
      child: Container(
          child:
                           Text(
        'Genre',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),),
                          ),
      SizedBox(
        height: 10,
      ),
      buildgenre(),
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
                          buildInscritBtn(),
                           SizedBox(
                            height: 10,
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
