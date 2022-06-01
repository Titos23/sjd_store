import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppStateManager extends ChangeNotifier{

  bool? _isLogin;
  bool? get isLogin => _isLogin;

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

  login(BuildContext context,{required String mail,required pass, }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: pass,
      );
      _isLogin = true;
      notifyListeners();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The username entered is not found"),
            duration: Duration(seconds: 2),
          )
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The password is not correct"),
            duration: Duration(seconds: 2),
          )
        );
      }
    }
  }

  signout () async {
    await FirebaseAuth.instance.signOut();
  }

}