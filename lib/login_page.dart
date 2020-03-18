import 'package:flutter/material.dart';
import 'package:flutterappweb/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<LoginModel>(context, listen: false).logIn();
          Navigator.of(context).pushNamed('/');
//          Navigator.of(context).pop();
        },
      ),
    );
  }
}