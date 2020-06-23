import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class  ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              body: pass()
            )
    );
  }

  Widget pass() {
    final _formKey = GlobalKey<FormState>();
    
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
        child: Form(
        key: _formKey,
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text('Alterar senha',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Informe sua antiga senha', hintStyle: TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, você precisa informar sua antiga senha';
                      }
                      // if (value != email) {
                      //   return 'Esse email não foi cadastrado ou está incorreto';
                      // }
                      return null;
                    }
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Informe sua nova senha', hintStyle: TextStyle(fontSize: 20)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, informe sua nova senha';
                        }
                        // if (value != password) {
                        //   return 'Senha Incorreta';
                        // }
                        return null;
                      },
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Confirme sua nova senha', hintStyle: TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Você precisa confirmar sua nova senha';
                      }
                      // if (value != password) {
                      //   return 'Senha Incorreta';
                      // }
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
                              //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ListTrainer();}));
                          }
                        },
                        child: Text("Salvar", style: TextStyle(fontSize: 20.0))
                      )
                ),
              ],
            ),
        )
    );
  }
}