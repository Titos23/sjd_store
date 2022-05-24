import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class AppStateManager extends ChangeNotifier{

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<void> init() async{

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _isLogin = true;
        notifyListeners();
      } else {
        _isLogin = false;
        notifyListeners();
      }
      notifyListeners();
    });
  } 
  
  login({required String mail,required pass}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: pass,
      );
      _isLogin = true;
      notifyListeners();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

}