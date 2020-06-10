import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'change_email2.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class  ChangeEmail extends StatefulWidget {
  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final _auth = FirebaseAuth.instance;
  var _userEmail = '';
  
  @override
    void initState() {
      super.initState();
        _auth.currentUser().then((user) {
          setState (() => _userEmail = user.email);
      });
    }
  
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
              body: actualEmail()
            )
    );
  }

  Widget actualEmail(){
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Seu e-mail atual', style: TextStyle(fontSize: 25),),
              Text(_userEmail, style: TextStyle(color: Colors.grey),)
            ],
          )
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          padding: EdgeInsets.all(10.0),
          onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {return NewEmail();}));
            
          },
          child: Text("Alterar endereço de e-mail", style: TextStyle(fontSize: 20.0))
        )
      ],
    );
  }
}