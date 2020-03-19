import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shopping Cart"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<LoginModel>(context, listen: false).logOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}