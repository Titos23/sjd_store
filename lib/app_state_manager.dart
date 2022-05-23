import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AppStateManager extends ChangeNotifier{

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  
  login({required String mail,required pass}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: pass,
      );
      _isLogin = true;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

}