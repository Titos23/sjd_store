import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier{

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  
  void login(String username, String password) {
    _isLogin = true;
    notifyListeners();
  }

}