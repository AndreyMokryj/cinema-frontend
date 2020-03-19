import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/views/login_page.dart';
import 'package:flutterappweb/views/shopping_cart.dart';
import 'package:flutterappweb/views/signup_page.dart';
import 'package:flutterappweb/views/tickets_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        initialRoute: '/',
        onGenerateRoute: _getRoute,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final String name;

  MainPage({Key key, this.name = "home"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool loggedIn = Provider.of<LoginModel>(context, listen: false).loggedIn ?? false;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!loggedIn) {
        Navigator.of(context).pushNamed("/login");
      }
    });
    if (loggedIn) {
      switch (name) {
        case 'cart':
          return ShoppingCart();
          break;
        default:
          return TicketsList();
      }
    }
    else {
      return Container();
    }
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case '/' :
      page = MainPage();
      break;
    case '/login' :
      page = LoginPage();
      break;
    case '/signup' :
      page = SignupPage();
      break;
    case '/cart' :
      page = MainPage(
        name: 'cart',
      );
      break;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => page,
    // fullscreenDialog: true,
  );
}
