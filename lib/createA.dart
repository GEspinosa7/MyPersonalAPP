import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register1.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class CreateAcPage extends StatefulWidget {
  @override
  _CreateAcPageState createState() => _CreateAcPageState();  
} 

class _CreateAcPageState extends State<CreateAcPage> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  saveUserData() async {
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('user_email', email );
    sharedPreference.setString('user_pass', password );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando sua conta', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
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
                      hintText: 'Informe um email',
                    ),
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, precisamos de um email';
                      }
                      return null;
                    },

                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Informe uma senha',
                    ),
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, você precisa de uma senha';
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
                              _formKey.currentState.save();
                              saveUserData();

                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return RegisterStepOne();
                        }));
                            }
                          },
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(fontSize: 20.0),
                          ))),
                ],
              ),
            )),
      );
  }
}

