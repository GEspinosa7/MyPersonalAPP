import 'package:flutter/material.dart';

import 'register1.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);


class CreateAcPage extends StatelessWidget {
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
                  // Text(
                  //   "Criando sua conta",
                  //   style: TextStyle(fontSize: 20.0),
                  //   textAlign: TextAlign.center
                  // ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Informe um email',
                    ),
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
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
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

final _formKey = GlobalKey<FormState>();
