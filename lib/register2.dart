import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                /**/
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Finalizando",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center
                  ),
                  Text(
                    "Atenção nesses dados, pois eles serão importantes para ajudar o personal a criar seu treino",
                    style: TextStyle(fontSize: 13.0),
                    textAlign: TextAlign.center
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Idade',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, informe sua idade';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Peso',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, informe seu peso';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Altura',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, informe sua altura';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Objetivo',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor , informe seu objetivo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Tempo Ativo',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'A quanto tempo que você pratica exercicios?';
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
                            "Cadastrar",
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
  