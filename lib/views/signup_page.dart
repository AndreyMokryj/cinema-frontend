import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/constants/styles.dart';
import 'package:flutterappweb/login_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginModel>(context, listen: false).logOut();
    });

    return Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[Form(
//          key: _formKey,
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
                    onSaved: (val) =>
                    {}
                    ,
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
                    onSaved: (val) =>
                    {}
                    ,
                  ),
                  const SizedBox(height: 20.0),
                  FlatButton(
                    //text: 'Войти',
                    child: Text(
                      'Зарегистрироваться'
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/login');
                    }
                  ),
                ],
              ))
          ),
          ],)
        ),
      );
  }
}