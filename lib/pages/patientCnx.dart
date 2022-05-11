import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcd/data/authentification.dart';



import '../pages/listeOrdPatient.dart';
import '../pages/profilPatient.dart';
import 'acceuil.dart';



class patient_cnx extends StatefulWidget{
  @override
  String idpatient;
  String patient;

  patient_cnx({required this.idpatient,required this.patient});
  State<StatefulWidget> createState() {
    return new _patient_cnxState();
  }
}

class _patient_cnxState extends State<patient_cnx> {
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
String img='';

  @override
  Widget build(BuildContext context) {
      final double height = MediaQuery
          .of(context)
          .size
          .height;
      final double width = MediaQuery
          .of(context)
          .size
          .width;
      return Scaffold(
        backgroundColor: Colors.white,
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text(''),
        //       ),
        //       ListTile(
        //         title: const Text('Profil'),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (_) => profile(idpatient: widget.idpatient)));
        //         },
        //       ),
        //       ListTile(
        //         title: const Text(''),
        //         onTap: () {
        //           // Update the state of the app.
        //           // ...
        //         },
        //       ),
        //     ],
        //   ),
        // ),

        /* ************nesrin************************ */
        // drawer: new Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.all(12),
        //     children: [
        //
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image:AssetImage('images/doctor.jpg')),
        //         ),
        //         child: Text(''),
        //       ),
        //       ListTile(
        //         title: const Text('Page Accueil'),
        //         tileColor: Colors.indigo.shade200,
        //         onTap: () {
        //           //Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: const Text('Liste Médicaments'),
        //         tileColor: Colors.indigo.shade100,
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: const Text('Liste Patients'),
        //         tileColor: Colors.indigo.shade50,
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: const Text('Liste Ordonnances'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       new FlatButton(onPressed: ()=>Navigator.pop(context), child: Text('Close Drawer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),color:Colors.deepOrange.shade100 ,),
        //     ],
        //   ),
        // ),
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     //Important: Remove any padding from the ListView.
        //         padding: EdgeInsets.zero,
        //
        //
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text(''),
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.home,
        //         ),
        //         title: const Text('Page 1'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(
        //           Icons.train,
        //         ),
        //         title: const Text('Page 2'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        //   drawer: Drawer(
        //     child: ListView(
        //       padding: EdgeInsets.zero,
        //       children: [
        //         const UserAccountsDrawerHeader(
        //           currentAccountPicture: CircleAvatar(
        //             backgroundImage: NetworkImage(
        //                 'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
        //           ),
        //           accountEmail: Text('jane.doe@example.com'),
        //           accountName: Text('Jane Doe',
        //             style: TextStyle(fontSize: 24.0),
        //           ),
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //           ),
        //         ),
        //         ListTile(
        //           leading: const Icon(Icons.person),
        //           title: const Text(
        //             'Profil',
        //             style: TextStyle(fontSize: 24.0),
        //           ),
        //           onTap: () {
        //             Navigator.pushReplacement(
        //               context,
        //               MaterialPageRoute<void>(
        //                 builder: (BuildContext context) => profile(idpatient: widget.idpatient)
        //               ),
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
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
                image: AssetImage("images/h.jpg"),
              )),
        ),
            Text('${widget.patient}',
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
                    builder: (BuildContext context) => profile(idpatient: widget.idpatient)
                  ),
                );
              },
    ),
    ]
    ),
    ),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: Builder(builder: (context) {
            return   RaisedButton(
              onPressed: ()async{

                Scaffold.of(context).openDrawer();}
              ,
              child: Icon(Icons.settings_applications_rounded,
              color: Colors.indigo.shade100,
              ),
              color: Colors.indigo.shade300,
            );
          }),
          backgroundColor: Colors.white,
          actions: [
            RaisedButton(
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => accueil()
                ));
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              color: Colors.indigo.shade300,
            ),
          ],
        ),
        // drawer: Drawer(
        //   // Add a ListView to the drawer. This ensures the user can scroll
        //   // through the options in the drawer if there isn't enough vertical
        //   // space to fit everything.
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text(''),
        //       ),
        //       ListTile(
        //         title: const Text('Profil'),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (_) => profilPatient(idpatient: widget.idpatient)));
        //         },
        //       ),
        //       ListTile(
        //         title: const Text(''),
        //         onTap: () {
        //           // Update the state of the app.
        //           // ...
        //         },
        //       ),
        //     ],
        //   ),
        // ),

        body: Column(
          children: [
            new Container(
              height: 180,
              //width: width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),),
                //color: Colors.cyan.shade100,
                color: Colors.indigo.shade100,
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
                      child: new Text("Espace Patient", style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.indigo.shade400,
                          fontWeight: FontWeight.bold),))
                ],
              ),
            ),
            SizedBox(height: height * 0.05,),
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
                              image: AssetImage("images/téléchargement.png"),
                            )
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 45,
                      left: 500,
                      child: Container(
                        height: 450,
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DigiOrd est à votre service", style: TextStyle(
                                color: Colors.indigo.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),),
                            Text("  ",
                               // "Pret de gérer l'état du patient.",
                              style: TextStyle(color: Colors.cyan.shade300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),),
                            const Divider(
                              height: 20,
                              thickness: 1,
                              //indent: 20,
                              //endIndent: 0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Avec DigiOrd,Tous vos ordonnances sont sauvdageés."
                                  " Vous pouvez les consulter à tout moment.",
                              style: TextStyle(color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),),
                            // FlatButton(onPressed: shownBottomSheet, child: Text(
                            //   "Show Details?", style: TextStyle(
                            //     color: Colors.cyan.shade700,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 12), textAlign: TextAlign.center,),),
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
                  children: [
                    new Row(
                      children: [
                        new Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 50),
                          width: 500,
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, bottom: 20),
                          child: new Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(80)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  //offset: Offset(-10.0, 10.0), //(x,y)
                                  blurRadius: 20,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.only(
                                left: 32, top: 50, bottom: 50
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 50),
                          width: 500,
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, bottom: 20),
                          child: new Container(
                            decoration: BoxDecoration(
                             // color: Colors.cyan,
                              color: Colors.indigo.shade300,
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
                            padding: const EdgeInsets.only(
                                left: 32, top: 50, bottom: 50
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new FlatButton(onPressed:
                                    () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          afficheord(
                                              idpatient: widget.idpatient,
                                            patient: widget.patient,
                                          )
                                      )
                                  );
                                }
                                    ,
                                    child: new Text('Liste Des Ordonnances',
                                      style: new TextStyle(fontSize: 30.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
  }


