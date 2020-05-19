import 'package:MyPersonal/cancelServices.dart';
import 'package:flutter/material.dart';
import 'start.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyPersonal());
}

class MyPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: CancelServices(),
      );
  }
}