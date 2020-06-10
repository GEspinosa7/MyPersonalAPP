import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class  NewEmail extends StatefulWidget {
  @override
  _NewEmailState createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
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
              body: newEmail()
            )
    );
  }

  Widget newEmail(){
    final _formKey = GlobalKey<FormState>();
    
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Informe seu novo endereço de e-mail', style: TextStyle(fontSize: 25),),
            ],
          )
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Form(
          key: _formKey,
            child: Column(
              children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Informe o novo e-mail', hintStyle: TextStyle(fontSize: 15)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa iformar um endereço de e-mail';
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
                          child: Text("Continuar", style: TextStyle(fontSize: 20.0))
                        )
                  ),
              ],
            ),
        )
        )
      ],
    );
  }
}