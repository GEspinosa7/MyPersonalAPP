import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'pages/start.dart';


void main() {
  runApp(MyPersonal());
}

class MyPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mainBlack),
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      );
  }
}