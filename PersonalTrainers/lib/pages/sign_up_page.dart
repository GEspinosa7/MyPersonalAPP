import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/services/trainer_profile_management.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 15,),
                RaisedButton(
                  child: Text('Criar Conta'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: _creating()
                ),
                SizedBox(height: 15,),
                Text('Ja tem uma conta?'),
                RaisedButton(
                  child: Text('Logar'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: _gotoLogin()
                ),
              ],
            ),
          ),
        )
      )
    );
  }

    _creating() async {
    _formKey.currentState.save();

    try {
      await _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((signedInTrainer) {TrainerProfileManagement().storeNewTrainer(signedInTrainer, context);
      });
      Navigator.of(context).pushNamed('/home_page');
    } catch (e) {
      print(e);
    }
    print(_email);
    print(_password);
  }

  _gotoLogin() async {
     Navigator.of(context).pushNamed('/login_page');
  }
}