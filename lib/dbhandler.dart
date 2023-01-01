import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';
import 'dart:math';

class DBHandlerService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('accounts');

  final CollectionReference serviceProviderCollection =
      FirebaseFirestore.instance.collection('serviceprovider');

  Stream<QuerySnapshot> get serviceprovider {
    return serviceProviderCollection.snapshots();
  }

  Future setUpNewAccount(
    String email,
    String fname,
  ) async {
    return await userCollection.doc(AuthService().user!.uid).set({
      'uid': AuthService().user!.uid,
      'email': email,
      'fname': fname,
    });
  }

  Future createNewContact(String firstname, String lastname, String reason,
      String birthday, String location) async {
    return await userCollection
        .doc(AuthService().user!.uid)
        .collection("contacts")
        .add({
      'firstname': firstname,
      'lastname': lastname,
      'reason': reason,
      'birthday': birthday,
      'location': location,
      'added_on': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future createAppointment2(
      String serviceproviderId,
      String serviceproviderName,
      String date,
      String time,
      String description) async {
    return await userCollection
        .doc(AuthService().user!.uid)
        .collection("termine")
        .add({
      'serviceprovider-id': serviceproviderId,
      'Datum': date,
      'Zeit': time,
      'Dienstleister': serviceproviderName,
      'Beschreibung': description,
      'isDone': false,
    });
  }

  Future deleteAppointment(String docId) async {
    return await userCollection
        .doc(AuthService().user!.uid)
        .collection("termine")
        .doc(docId)
        .delete();
  }

  Future updateAppointment(String docId, String date, String kunde) async {
    return await userCollection
        .doc(AuthService().user!.uid)
        .collection("termine")
        .doc(docId)
        .update({
      'Datum': date,
      'Dienstleister': kunde,
    });
  }
}
