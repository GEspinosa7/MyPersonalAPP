import 'package:MyPersonal/pages/client_profile_register.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  
  var _email = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
        body: Container(
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
                    child: Text('Crie sua conta', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  decoration:  InputDecoration(
                    hintText: 'Informe seu email', 
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSaved: (value) => _email = value
                ),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  decoration:  InputDecoration(
                    hintText: 'Informe sua senha', 
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                          onPressed: _gotoLogin, child: Text("Já tenho uma conta", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))
                        ),
                        RaisedButton(
                          color: mainBlack,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: _creating, child: Text("Criar conta", style: TextStyle(fontSize: 20.0))
                        ),
                      ],
                    )
                  ),
                ],
              ),
          )
        )
    );
  }

  _creating() async {
    _formKey.currentState.save();

    try {
      await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ClientProfileRegister()));

    } catch (e) {
      print(e);
    }
    print(_email);
    print(_password);
  }

  _gotoLogin() async {
     Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
  }
}