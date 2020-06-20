import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/pages/home.dart';
import 'package:my_personal_personaltrainer/pages/login_page.dart';
import 'package:my_personal_personaltrainer/pages/sign_up_page.dart';
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
      // routes: <String, WidgetBuilder> {
      //   '/lading_page': (BuildContext context) => new MyPersonal(),
      //   '/sign_up': (BuildContext context) => new SignUpPage(),
      //   '/login_page': (BuildContext context) => new LoginPage(),
      //   '/home_page': (BuildContext context) => new HomePage()
      // },
      );
  }
}