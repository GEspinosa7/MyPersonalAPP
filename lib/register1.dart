import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vamos cadastrar seu perfil!",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center
                  ),
                  Text(
                    "Informe seus dados",
                    style: TextStyle(fontSize: 13.0),
                    textAlign: TextAlign.center
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Nome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Você não tem um nome?';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Sobrenome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Você não tem um sobrenome?';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'N° Celular',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, seu número é necessário';
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
                              // Process data.
                            }
                          },
                          child: Text(
                            "Próximo",
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
