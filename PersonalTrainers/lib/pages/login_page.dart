import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/pages/sign_up_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 15,),
                RaisedButton(
                  child: Text('Entrar'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: _loging()
                ),
                SizedBox(height: 15,),
                Text('Não tem uma conta?'),
                RaisedButton(
                  child: Text('Criar Conta'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: (){
                    _gotoCreate();
                  },
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  _gotoCreate() async {
     Navigator.of(context).pushNamed('/sign_up');
  }

  _loging() async {
    _formKey.currentState.save();

    try {
      await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pushReplacementNamed('/home_page');
    } catch (e) {
      print(e);
    }
  }
}