import 'package:flutterappweb/model/user_model.dart' as u;

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Map<String, u.User> _usermaps = {};

//  Map<String, u.User> get users {
//    if (_users == null){
//      initDB();
//    }
//    return _users;
//  }
//  
//  void initDB() {
//    _users = {};
//  }

  bool newUser(u.User user) {
    if (_usermaps.containsKey(user.username)){
      return false;
    }
    _usermaps.addAll({
      user.username : user,
    });
    return true;
  }

  bool checkUser(u.User user) {
    if (!(_usermaps.containsKey(user.username))){
      return false;
    }
    if(_usermaps[user.username].password == user.password){
      return true;
    }
    return false;
  }
}