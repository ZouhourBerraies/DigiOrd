import 'package:flutter/material.dart';

class Addnote extends StatefulWidget {
  @override
  _AddnoteState createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  TextEditingController numpatient = TextEditingController();
  TextEditingController nommedecin = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController time = TextEditingController();
  // CollectionReference ref = FirebaseFirestore.instance.collection('dossiers');

  DateTime date = DateTime(2022, 03, 22);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Dossier Médical',
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  hintText: "Entrer le nom du Medecin ...",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade200,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade200,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Entrer les informations  ...",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontStyle: FontStyle.italic,
                      ),
                      contentPadding: const EdgeInsets.all(20.0))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
