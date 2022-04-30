import 'package:cloud_firestore/cloud_firestore.dart';


class CreateOrd {
  // String idpatient;
  // String random;
  // CreateOrd({
  //   required this.idpatient,
  //   required this.random,
  // });
  final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');
  final CollectionReference profilListPhar = FirebaseFirestore.instance.collection('profileInfoPharmacie');

  Future<void> AjouterOrd(DateTime date, String doctor, String idmedecin,
      String patient, String signature, String idpatient, String random) async {
    //final CollectionReference profilList = FirebaseFirestore.instance.collection('profileInfoPatient');
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        random)
        .set({
      'date': date,
      'nom medecin': doctor,
      'num medecin': idmedecin,
      'patient': patient,
      'signature': signature,
      'numero': random,
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
  }

  Future<void> AjouterMedic(String random, int dose, String medic,
      String numero, int parjour, String idpatient, int nbrjour) async {
    //final CollectionReference profilList = FirebaseFirestore.instance.collection(table);

    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        random).collection("ListeMedicament")
        .doc(numero).set({
      'Medicament': medic,
      'dose': dose,
      'par jour': parjour,
      'nombre de jour': nbrjour,
      'numeroMedic': numero,
      'substituer': "non",
      'délivrer': "non"
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
  }

  Future<void> UpdateMedic(String Nummedic, int dose, String medic,
      String numero, int parjour, String idpatient, int nbrjour) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numero).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      'Medicament': medic,
      'dose': dose,
      'par jour': parjour,
      'nombre de jour': nbrjour,

    });
  }

  Future<void> substituerMedic(String Nummedic, String medic, String numero,
      String idpatient) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numero).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      "substituer": medic
    });
  }

  Future<void> delivrerMedic(String medic, String numero,
      String idpatient) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numero).collection("ListeMedicament")
        .doc(medic)
        .update({
      "délivrer": "oui"
    });
  }

/*******/


  Future<List?> getCurrentUserData(String idpatient,String numero,String Nummedic) async {
    List infomedic = [];
    try {
      DocumentSnapshot ds =
      await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
          numero).collection("ListeMedicament")
          .doc(Nummedic).get();
      String medicament = ds.get('Medicament');
      String dose = ds.get('dose').toString();
      String nbrparjour = ds.get('par jour').toString();
      String nbrjour = ds.get('nombre de jour').toString();

      infomedic = [medicament,dose,nbrparjour,nbrjour];
      return infomedic;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> AjouterOrdPhar(DateTime date, String idpharmacie, String doctor,
      String idmedecin, String idpatient, String patient, String signature,
      String random) async {
    return await profilListPhar.doc(idpharmacie).collection(
        'ListeOrdonnancePharmacie').doc(random)
        .set({
      'date': date,
      'nom medecin': doctor,
      'num medecin': idmedecin,
      'num patient': idpatient,
      'nom patient': patient,
      'signature': signature,
      'numero': random,
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
  }
  Future<void> DelivMedic(String numero,String numeroMedic, String medicament,
      int dose, int parjour, int nbrjour,String idpharmacie) async {
    return await profilListPhar.doc(idpharmacie).collection('ListeOrdonnancePharmacie').doc(
        numero).collection("ListeMedicamentDelivre")
        .doc(numeroMedic)
        .set({
     'Medicament': medicament,
      'dose': dose,
      'par jour': parjour,
      'nombre de jour': nbrjour,
      'numeroMedic':numeroMedic ,
      'substituer': "non",
      'délivrer': "oui"

    });
  }
  Future<void> SubMedic(String numero,String numeroMedic, String medicament,
      int dose, int parjour, int nbrjour,String idpharmacie,String medic) async {
    return await profilListPhar.doc(idpharmacie).collection('ListeOrdonnancePharmacie').doc(
        numero).collection("ListeMedicamentDelivre")
        .doc(numeroMedic)
        .set({
      'Medicament': medicament,
      'dose': dose,
      'par jour': parjour,
      'nombre de jour': nbrjour,
      'numeroMedic':numeroMedic ,
      'substituer':medic ,
      'délivrer': "non"

    });
  }


}