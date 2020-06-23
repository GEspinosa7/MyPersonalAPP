import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'pages/start.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() {
  initializeDateFormatting().then((_) => runApp(MyPersonal()));  
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