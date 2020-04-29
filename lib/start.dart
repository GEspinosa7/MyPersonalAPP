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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcome(),
        login(),
        createAc(),
      ],
    );
  }

  Widget welcome() {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 120,
      width: double.infinity,
      child:
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo(a) ao My Personal!', style: TextStyle(fontSize: 18.0)),
            Text('Vamos começar?', style: TextStyle(fontSize: 16.0)),
          ]
        )
    );
  }

  Widget login() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child:
        FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            /*...*/
          },
          child: Text(
          "Login",
          style: TextStyle(fontSize: 20.0),
          )
        )
    );
  }
  
    Widget createAc() {
    return Container(
      margin: EdgeInsets.all(30.0),
      child:
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            /*...*/
          },
          child: Text(
          "Criar Conta",
          style: TextStyle(fontSize: 20.0),
          )
        )
    );
  }
}
