import 'package:flutter/material.dart';
import '../pages/acceuil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyC2QKOLUFFanohvJQvf3Fp1PQo1GyeOfoU",
      appId: "1:625808989668:android:4b5eaf6e3472202421fbf1",
      messagingSenderId: "XXX",
      projectId: "pcdfirebase-2e9a1",

    ),
  );

  runApp(DigiOrdApp());
}

class DigiOrdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DigiOrd',
      debugShowCheckedModeBanner: false,

      home: new accueil(),

    );
  }
}



