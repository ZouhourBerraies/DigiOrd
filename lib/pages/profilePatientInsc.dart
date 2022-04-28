import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/Create.dart';
class profile extends StatefulWidget {

  String idpatient;

  profile(
      {
        required this.idpatient,
      });

  @override

  _profilestate createState() => _profilestate();

}

class _profilestate extends State<profile>{

  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfoPatient');
  final Create user = Create (table: 'profileInfoPatient');
  final Stream <QuerySnapshot> users=FirebaseFirestore.instance.collection('profileInfoPatient').snapshots();
  List itemsList=[];

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController motpasse = TextEditingController();
  TextEditingController telephone = TextEditingController();


  int current=0;
  //handle indicator
  List<T> map<T>(List list,Function handler){
    List<T> result=[];
    for(var i=0;i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }
  List genretype = ['-----', 'Homme', 'Femme'];

  String dropdownValue = "-----";
  Widget buildgenre() {

    return Container(

        padding: EdgeInsets.only(left: 16.0, right: 16.0),

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






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        backgroundColor: Colors.cyan.shade700,
        leading:IconButton(
          icon:Icon(
            Icons.arrow_back,
            color:Colors.white,
          ),
          onPressed:(){},
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 70),
            icon:Icon(
              Icons.settings,
              color:Colors.white,
            ),
            onPressed:(){},
          ),
        ],
      ),

      body: Container(
        padding:  EdgeInsets.only(left:16,top:25,right:16),
        child: ListView(
          children: [
            Text(
              'Edit Profil',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        boxShadow: [BoxShadow(
                            spreadRadius: 2,blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0,1)
                        )],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage("images/docicon.jpg"),

                        )
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child:Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                            shape: BoxShape.circle,
                            color: Colors.indigo.shade50
                        ),
                        child:Icon(
                          Icons.edit,
                          color: Colors.blueGrey.shade700,
                        ) ,
                      )
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: nom,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Nom',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                 hintText: 'Tapez Votre Nom',

                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                ),
                icon: Icon(Icons.perm_identity),
              ),
            ),
            TextField (
              controller: prenom,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Prénom',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Prénom',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                ),
                icon: Icon(Icons.perm_identity),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                child:
                Text(
                  '   Genre',
                  textAlign: TextAlign.left,
                  /*style: TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),*/
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildgenre(),
            TextField(
              controller: motpasse,
              autocorrect: true,
              autofocus: true,
              obscureText: true,
              maxLength: 30,
              decoration: InputDecoration(
                //suffixIcon: isPasswordTextField ? IconButton(onPressed: onPressed:(){}, icon: Icon(icons.rem)),
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Mot De Passe',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre MDP',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                ),
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              controller: email,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Email',

                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                ),
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              controller: telephone,
              autocorrect: true,
              autofocus: true,
              maxLength: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Numéro Télephoe',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Tapez Votre Numero Telephone',
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                ),
                icon: Icon(Icons.mobile_friendly_outlined),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 16,bottom: 13,top: 29,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(onPressed: (){}, child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.indigo.shade300,),

                FlatButton(onPressed: (){
                  //widget.docToEdit.reference.update({
                  user.UpdateUserInsc(widget.idpatient, nom.text, prenom.text, email.text, motpasse.text, telephone.text, dropdownValue);
                  Navigator.pop(context);

                },
                  child: Text('Save',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.indigo.shade300,),

              ],

            )
          ],
        ),
      ),

    );
  }



}
