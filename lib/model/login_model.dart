import 'package:flutter/material.dart';
import 'package:flutterappweb/model/user_model.dart';

class LoginModel extends ChangeNotifier {
  bool loggedIn;
  User _user;
  get user => _user;
  List<int> _placeIds;
  get placeIds => _placeIds;

  void logIn(User u)  {
    _user = u;
    loggedIn = true;
    _placeIds = [];
    notifyListeners();
  }

  void logOut() {
    _user = null;
    loggedIn = false;
    _placeIds = [];
    notifyListeners();
  }

  void addPlaceId(int placeId){
    _placeIds.add(placeId);
    notifyListeners();
  }

  void removePlaceId(int placeId){
    _placeIds.remove(placeId);
    notifyListeners();
  }

  void clearPlaceIds(){
    _placeIds = [];
    notifyListeners();
  }
}