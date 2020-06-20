import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class  PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Alterar/Adicionar Telefone', textAlign: TextAlign.center),
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
              body: Text('foi')
            )
    );
  }
}