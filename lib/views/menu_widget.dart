import 'package:flutter/material.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Главная"),
            onTap: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Корзина"),
            onTap: (){
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
            onTap: (){
              Provider.of<LoginNotifier>(context, listen: false).logOut();
              Navigator.of(context).pushNamed('/login');            },
          ),
        ],
      ),
    );
  }
}