import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/pages/createA.dart';
import 'package:my_personal_personaltrainer/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _email = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Image.asset('assets/img/logo_texto.png'),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text('Entre com usa conta',
                        style: TextStyle(fontSize: 20.0)),
                  ),
                ),
                TextFormField(
                    autofocus: true,
                    decoration:
                        const InputDecoration(hintText: 'Informe seu email'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, precisamos do seu email';
                      }
                      // if (value != email) {
                      //   return 'Esse email não foi cadastrado ou está incorreto';
                      // }
                      return null;
                    },
                    onSaved: (value) => _email = value),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: 'Informe sua senha'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, você precisa informar sua senha';
                    }
                    // if (value != password) {
                    //   return 'Senha Incorreta';
                    // }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                            color: Colors.transparent,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            onPressed: _gotoCreate,
                            child: Text("Não tenho uma conta",
                                style: TextStyle(fontSize: 15.0))),
                        RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            onPressed: _loging,
                            child: Text("Entrar",
                                style: TextStyle(fontSize: 20.0))),
                      ],
                    )),
              ],
            ),
          )),
    ));
  }

  _gotoCreate() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => CreatePage()));
  }

  _loging() async {
    _formKey.currentState.save();

    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }
}

class Register {}
