import 'package:flutter/material.dart';
import 'register2.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class RegisterStepOne extends StatefulWidget {
  @override
  _RegisterStepOneState createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  @override

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando perfil', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child:
           Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Informe seus dados",
                  style: TextStyle(fontSize: 18.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FlatButton(
                    color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {return RegisterStepTwo();}));
                        }
                      },
                      child: Text("Próximo", style: TextStyle(fontSize: 20.0),)
                  )
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
