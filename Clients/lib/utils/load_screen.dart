import 'package:flutter/material.dart';

import 'colors.dart';

Widget mainLoad(){
      return Scaffold(
      backgroundColor: mainGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Image.asset('assets/img/logo_texto.png'),
          ),
          CircularProgressIndicator(
            backgroundColor: mainBlack,
          ),
        ],
      )
    );
}

Widget normalLoad(){
  return Scaffold(
      backgroundColor: mainGreen,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: mainBlack,
        ),
      ),
    );
}