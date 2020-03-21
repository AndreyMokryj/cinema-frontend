import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/styles.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginModel>(context, listen: false).logOut();
    });

    return Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[Form(
          key: _formKey,
            child: SingleChildScrollView(padding: EdgeInsets.all(10.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Введите адрес электронной почты и пароль',
                    style: TextStyle(fontSize: 12.0)),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    style: fieldTextStyle,
                    enabled: true,
//                  decoration: AppDecoration(
//                    labelText: AppLocalizations.of(context).localizedText(
//                      'signInEnterLoginText'),
//                    hintText: AppLocalizations.of(context).localizedText(
//                      'signInEnterLoginHint'),
//                  ),
                    keyboardType: TextInputType.emailAddress,
//                  validator: (val) =>
//                    fieldError('username', val.isEmpty ? AppLocalizations.of(
//                      context).localizedText('signInNoLoginError') : null),
                    autovalidate: true,
                    onSaved: (val) => newUser.username = val,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    style: fieldTextStyle,
                    enabled: true,
//                  decoration: AppDecoration(
////                    labelText: 'Password',
////                    hintText: 'Пароль для входа'
//                    labelText: AppLocalizations.of(context).localizedText(
//                      'signInEnterPasswordText'),
//                    hintText: AppLocalizations.of(context).localizedText(
//                      'signInEnterPasswordHint'),
//                  ),
                    obscureText: true,
//                  validator: (val) =>
//                    fieldError('password', val.isEmpty ? AppLocalizations.of(
//                      context).localizedText('signInNoPasswordError') : null),
                    autovalidate: true,
                    onSaved: (val) => newUser.password = val,
                  ),
                  const SizedBox(height: 20.0),
                  FlatButton(
                    //text: 'Войти',
                    child: Text(
                      'Зарегистрироваться'
                    ),
                    onPressed: () {
//                      var success = DBProvider.db.newUser(User(username: "admin", password:"admin"));
//                      if(success) {
//                        Navigator.of(context).pushNamed('/login');
//                      }
                      _submit();
                    }
                  ),
                ],
              ))
          ),
          ],)
        ),
      );
  }

  void _submit() async {
    final FormState form = _formKey.currentState;
    form.save();
    if (await DBProvider.db.newUser(newUser)) {
      Navigator.of(context).pushNamed('/login');
    }
  }
}