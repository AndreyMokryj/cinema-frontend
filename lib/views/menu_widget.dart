import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/login_model.dart';
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
              clearSelPlaces(context);
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Корзина"),
            onTap: (){
              clearSelPlaces(context);
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
            onTap: (){
              clearSelPlaces(context);
              Provider.of<LoginModel>(context, listen: false).logOut();
              Navigator.of(context).pushNamed('/login');            },
          ),
        ],
      ),
    );
  }

}