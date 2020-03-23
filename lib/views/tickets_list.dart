import 'package:flutter/material.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:provider/provider.dart';

class TicketsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
//    return
////      WillPopScope(
////      onWillPop: (){
//////        Navigator.of(context).pop(false);
////      },
////      child:
//      Scaffold(
//        body:
//        Center(
//          child: Text("List of tickets"),
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: (){
//            Provider.of<LoginModel>(context, listen: false).logOut();
//            Navigator.of(context).pushNamed('/login');
//          },
//        ),
////      ),
//    );
    return Center(
      child: Text("List of tickets"),
    );
  }
}