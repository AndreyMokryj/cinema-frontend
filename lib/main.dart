import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/login_model.dart';
import 'package:flutterappweb/login_page.dart';
import 'package:flutterappweb/shopping_cart.dart';
import 'package:flutterappweb/tickets_list.dart';
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
        home: HomePage(),
        initialRoute: '/',
        onGenerateRoute: _getRoute,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool loggedIn = Provider.of<LoginModel>(context, listen: false).loggedIn ?? false;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!loggedIn) {
        Navigator.of(context).pushNamed("/login");
      }
    });
    return TicketsList();
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case '/' :
      page = HomePage();
      break;
    case '/login' :
      page = LoginPage();
      break;
    case '/cart' :
      page = ShoppingCart();
      break;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => page,
    // fullscreenDialog: true,
  );
}
