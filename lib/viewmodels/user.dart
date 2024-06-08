import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/models/user.dart';

class RegisterViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> register(UserModel user) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user.uid)
          .set({
        'name': user.name,
        'dateOfBirth': user.dateOfBirth,
        'phoneNumber': user.phoneNumber,
        'gender': user.gender,
      });

      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'An unknown error occurred';
    }
  }
}

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModelLogin? _user;
  UserModelLogin? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = UserModelLogin(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
      notifyListeners();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
