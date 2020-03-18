import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/login_model.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool loggedIn = Provider.of<LoginModel>(context, listen: false).loggedIn ?? false;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!loggedIn) {
        Navigator.of(context).pushNamed("/login");
      }
    });

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