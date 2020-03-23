import 'dart:convert';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/user_model.dart' as u;
import 'package:http/http.dart' as http;

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Future<bool> newUser(u.User user) async {
    final response = await http.post(
      "${baseUrl}users/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<bool> checkUser(u.User user) async {
    final response = await http.post(
      "${baseUrl}users/check/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
}