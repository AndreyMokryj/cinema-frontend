import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/login_model.dart';
import 'package:flutterappweb/login_page.dart';
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
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
      if (loggedIn) {
        Navigator.of(context).pushNamed("/");
      }
      else {
        Navigator.of(context).pushNamed("/login");
      }
    });
    return Container();
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case '/main' :
      page = TicketsList();
      break;
    case '/login' :
      page = LoginPage();
      break;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => page,
    // fullscreenDialog: true,
  );
}
