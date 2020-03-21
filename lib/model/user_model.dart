class User{
  String username;
  String password;

  User({this.username, this.password});

  Map<String, String> toMap(){
    return {
      'username' : username,
      'password' : password,
    };
  }

  String toJson(){
    return '{"username" : "$username", "password" : "$password"}';
  }
}