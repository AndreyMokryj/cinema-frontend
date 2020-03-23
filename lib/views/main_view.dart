import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/views/menu_widget.dart';
import 'package:flutterappweb/views/shopping_cart.dart';
import 'package:flutterappweb/views/tickets_list.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  final String name;

  const MainView({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (name != 'home') {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(pageNames[name]),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: MenuWidget(),
            ),
            Expanded(
              flex: 4,
              child: Builder(
                builder: (context) {
                  switch (name) {
                    case 'cart':
                      return ShoppingCart();
                      break;
                    default:
                      return TicketsList();
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Provider.of<LoginModel>(context, listen: false).logOut();
            Navigator.of(context).pushNamed('/login');
          },
        ),
      ),
    );
  }

}