import 'package:flutter/material.dart';
import 'timeToSearch.dart';

class RegisterStepTwo extends StatefulWidget {
  @override
  _RegisterStepTwoState createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo> {
  @override

  Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Finalizando perfil', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child:
             Form(
              key: _formKey,
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
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
                        keyboardType: TextInputType.number,
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
                        keyboardType: TextInputType.number,
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
                        child:
                        FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {return SearchStep();}));
                              }
                          },
                          child: Text("Cadastrar", style: TextStyle(fontSize: 20.0),)
                        )
                      ),
                  ],
                ),
            )
        ),
      );
  }
}

  