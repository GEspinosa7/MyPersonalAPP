import 'package:flutter/material.dart';

import 'colors.dart';

Widget mainLoad(){
      return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Image.asset('assets/img/logo_texto.png'),
          ),
          CircularProgressIndicator(
            backgroundColor: mainGreen,
          ),
        ],
      )
    );
}

Widget normalLoad(){
  return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: mainGreen,
        ),
      ),
    );
}