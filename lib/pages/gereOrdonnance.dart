
import 'package:flutter/material.dart';

import 'ordonnance.dart';



class gerer_ord extends StatefulWidget {
  const gerer_ord({Key? key}) : super(key: key);

  @override
  _gerer_ordState createState() => _gerer_ordState();
}


class _gerer_ordState extends State<gerer_ord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Les ordonnances médicales')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>Addord()));
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




