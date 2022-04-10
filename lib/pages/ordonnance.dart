import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';



class Addord extends StatefulWidget {
  @override
  _AddordState createState() => _AddordState();
}

class _AddordState extends State<Addord> {
  final controller = TextEditingController();
  Widget buildqr(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //buildsave(context),
          Row(
            children: [
              Expanded(child: buildTextField(context)),
              const SizedBox(width: 12),
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.done, size: 30),
                onPressed: () => setState(() {}),
              )
            ],
          ),
          //SizedBox( height: 40, ),
          /*QrImage(
            data: controller.text,
            size: 50,
            backgroundColor: Colors.white,
          ),*/
          SizedBox(height: 10),
          BarcodeWidget(
            barcode: Barcode.qrCode(),
            color: Colors.black,
            data: controller.text ,
            width: 500,
            height: 50,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.black,
      //fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: 'Enter Signature',
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );

  Widget buildsave(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        hintText: 'Enter a search term',
        suffixIcon: IconButton(
          icon: Icon(Icons.done, size: 30),
          onPressed: () => setState(() {}),
        ),
      ),
    );
  }


  TextEditingController numpatient = TextEditingController();
  TextEditingController nommedecin = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController time = TextEditingController();
  DateTime date = DateTime(2022, 03, 22);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'ordonnance',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue.shade500),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.centre,
              children: [


                Text(
                  '${date.year}/${date.month}/${date.day}',
                  style:TextStyle(fontSize:32),
                ),





                SizedBox(height: 16),
                ElevatedButton(
                  child: Text(
                    'Entrer la date d\'aujourd\'hui',
                  ),
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2100),
                    );
                    if (newDate == null) return;
                    setState(() => date = newDate);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: nommedecin,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 250, 251, 252),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Entrer le nom du Medecin ...",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: numpatient,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade200,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Entrer le nom du Patient ...",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FractionColumnWidth(0.35),
                  1: FractionColumnWidth(0.15),
                  2: FractionColumnWidth(0.25),
                  3: FractionColumnWidth(0.25),
                },
                children: [
                  buildRow(['medicament', 'dose', 'parjour', 'nbrJour'],
                      isHeader: true),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildqr(context),
            ElevatedButton.icon(
                onPressed: ()  {},
                icon: const Icon(Icons.save),
                label: const Text('Save')),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialogueBox(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
          semanticLabel: 'ajouter medicament',
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
      children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        );

        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(child: Text(cell)),
        );
      }).toList());

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ajouter Medicament'),
            content: Container(
              height: 250,
              child: Column(
                children: [
                  TextField(
                    //controller: _nameController,
                    decoration: InputDecoration(hintText: 'medicament'),
                  ),
                  TextField(
                    //controller: _genderController,
                    decoration: InputDecoration(hintText: 'dose'),
                  ),
                  TextField(
                    //controller: _scoreController,
                    decoration: InputDecoration(hintText: 'parjour'),
                  ),
                  TextField(
                    //controller: _scoreController,
                    decoration: InputDecoration(hintText: 'nbrJour'),
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  // submitAction(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }
/*submitAction(BuildContext context) {
    updateData(_nameController.text, _genderController.text,
        int.parse(_scoreController.text), userID);
    _nameController.clear();
    _genderController.clear();
    _scoreController.clear();
  }*/

}
