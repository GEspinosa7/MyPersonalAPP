import 'package:flutter/material.dart';

import 'searchPersonal.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seja bem-Vindo(a) de volta!', textAlign: TextAlign.center),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
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
                      hintText: 'Informe seu email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, precisamos do seu email';
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
                          return PersonalListPage();
                        }));
                            }
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20.0),
                          ))),
                ],
              ),
            )),
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();
