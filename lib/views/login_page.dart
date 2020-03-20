import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/styles.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginModel>(context, listen: false).logOut();
    });

    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed('/');
      },
      child: Scaffold(
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
                      'Войти'
                    ),
                    onPressed: () => _submit(),

                  ),
                  const SizedBox(height: 11.0),
                  const SizedBox(height: 27.0),
                  FlatButton(
                    child: Text('Зарегистрироваться',
                      style: TextStyle(fontFamily: 'PT Sans',
                        fontSize: 14.0,
                        color: Colors.black),),
                    onPressed: () => Navigator.of(context).pushNamed('/signup'),
                  )
                ],
              ))
          ),
          ],)
        ),
      ),
    );
  }

  void _submit() {
    final FormState form = _formKey.currentState;
    form.save();
    if (DBProvider.db.checkUser(newUser)) {
      Provider.of<LoginModel>(context, listen: false).logIn();
      Navigator.of(context).pushNamed('/');
    }
  }
}