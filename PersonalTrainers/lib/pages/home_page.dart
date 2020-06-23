import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        centerTitle: true
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Você está logado'),
              SizedBox(height: 15.0,),
              new OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('Sair'),
                onPressed: _exit()          
              ),  
            ],
          ),
        ),
      ),
    );
  }

  _exit() async {
    _auth.signOut().then((value) {
      Navigator.of(context).pushReplacementNamed('/landing_page');
    }).catchError((e) {
      print(e);
    });
  }
}