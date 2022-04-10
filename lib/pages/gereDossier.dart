
import 'package:flutter/material.dart';

import 'notesMedc.dart';



class gerer_doss extends StatefulWidget {
  const gerer_doss({Key? key}) : super(key: key);

  @override
  _gerer_dossState createState() => _gerer_dossState();
}


class _gerer_dossState extends State<gerer_doss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dossier medical')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Addnote()));
        },
      ),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Container(
              height: 150,
              margin: EdgeInsets.all(10.0),
              color: Colors.grey[200],
            );
          }),
    );
  }
}




