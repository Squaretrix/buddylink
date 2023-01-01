import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dbhandler.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('accounts');

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    //todo add selectedUser logic
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //print('success!' + user!.uid);
    } on FirebaseAuthException catch (e) {
      //print(email + password);
      print(e.message);
    }
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String fname,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

    await DBHandlerService().setUpNewAccount(email, fname);

    //print('success!' + user!.uid);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
