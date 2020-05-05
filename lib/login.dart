import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'searchTrainer.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  var email = '';
  var password = '';

  @override

  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((instance) {
      setState(() {
        email = instance.getString('user_email');
        password = instance.getString('user_pass');
      });
    });
  }

  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Seja bem-Vindo(a) de volta!', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: login()
      );
  }

  Widget login() {
        final _formKey = GlobalKey<FormState>();
    return Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Informe seu login',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, precisamos do seu email';
                      }
                      if (value != email) {
                        return 'Esse email não foi cadastrado ou está incorreto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Informe sua senha',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, você precisa informar sua senha';
                      }
                      if (value != password) {
                        return 'Senha Incorreta';
                      }
                      return null;
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return ListTrainer();
                        }));
                            }
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20.0),
                          ))),
                ],
              ),
            ));
  }
}


