import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  bool loggedIn;

  void logIn()  {
    loggedIn = true;
    notifyListeners();
  }

  void logOut()  {
    loggedIn = false;
    notifyListeners();
  }
}