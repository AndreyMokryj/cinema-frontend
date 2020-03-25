import 'package:flutter/material.dart';
import 'package:flutterappweb/model/user_model.dart';

class LoginModel extends ChangeNotifier {
  bool loggedIn;
  User _user;
  get user => _user;
  List<int> placeIds;

  void logIn(User u)  {
    _user = u;
    loggedIn = true;
    placeIds = [];
    notifyListeners();
  }

  void logOut() {
    _user = null;
    loggedIn = false;
    placeIds = [];
    notifyListeners();
  }
}