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

  Future<void> AjouterMedic(String random, String numero,String medic,int parjour,int nbrjour,String remarque,String idpatient
 ) async {

    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        random).collection("ListeMedicament")
        .doc(numero).set({
      'numeroMedic': numero,
      'medicament': medic,
      'nombre de fois par jour': parjour,
      'nombre de jour': nbrjour,
      'remarque':remarque,
      'substituer': "non",
      'délivrer': "non"
    }).then((value) => print('user added'))
        .catchError((error) => print('erreur add user:$error'));
  }

  Future<void> UpdateMedic(String numeroOrd,String Nummedic, String medic,
       int parjour, int nbrjour, String remarque,String idpatient) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numeroOrd).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      'medicament': medic,
      'nombre de fois par jour': parjour,
      'nombre de jour': nbrjour,
      'remarque':remarque,

    });
  }

  Future<void> substituerMedic(String numeroOrd, String Nummedic, String medic,
      String idpatient) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numeroOrd).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      "substituer": medic
    });
  }

  Future<void> delivrerMedic(String numeroOrd, String Nummedic,
      String idpatient) async {
    return await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
        numeroOrd).collection("ListeMedicament")
        .doc(Nummedic)
        .update({
      "délivrer": "oui"
    });
  }

/*******PharmacieScanner*****/


  Future<List?> getCurrentUserData(String idpatient,String numero,String Nummedic) async {
    List infomedic = [];
    try {
      DocumentSnapshot ds =
      await profilList.doc(idpatient).collection('ListeOrdonnance').doc(
          numero).collection("ListeMedicament")
          .doc(Nummedic).get();
      String medicament = ds.get('medicament');
      String nbrparjour = ds.get('nombre de fois par jour').toString();
      String nbrjour = ds.get('nombre de jour').toString();
      String remarque=ds.get('remarque');

      infomedic = [medicament,nbrparjour,nbrjour,remarque];
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
  Future<void> DelivMedic(String numeroOrd,String numeroMedic, String medicament,
      int parjour, int nbrjour,String remarque,String idpharmacie) async {
    return await profilListPhar.doc(idpharmacie).collection('ListeOrdonnancePharmacie').doc(
        numeroOrd).collection("ListeMedicamentDelivre")
        .doc(numeroMedic)
        .set({
      'numeroMedic':numeroMedic ,
     'Medicament': medicament,
      'nombre de fois par jour': parjour,
      'nombre de jour': nbrjour,
      'substituer': "non",
      'délivrer': "oui"

    });
  }
  Future<void> SubMedic(String numeroOrd,String numeroMedic, String medicament,
       int parjour, int nbrjour,String remarque,String idpharmacie,String medic) async {
    return await profilListPhar.doc(idpharmacie).collection('ListeOrdonnancePharmacie').doc(
        numeroOrd).collection("ListeMedicamentDelivre")
        .doc(numeroMedic)
        .set({
  'numeroMedic':numeroMedic ,
      'Medicament': medicament,
      'par jour': parjour,
      'nombre de jour': nbrjour,
      'remarque':remarque,
      'substituer':medic ,
      'délivrer': "non"

    });
  }


}