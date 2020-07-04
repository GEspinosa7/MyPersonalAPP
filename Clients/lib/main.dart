import 'package:MyPersonal/pages/start.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';

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
