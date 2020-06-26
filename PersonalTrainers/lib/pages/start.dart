import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/pages/home.dart';
import 'package:my_personal_personaltrainer/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/http.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';

import 'trainer_profile_register.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _auth = FirebaseAuth.instance;
  final _service = TrainerService();

  @override
  void initState() {
    super.initState();
    _navegate();
  }

  _navegate() async {
    final user = await _auth.currentUser();

    if (user != null) {
      try {
        await _service.getTrainerProfile(user.uid);
        Http.instance.options.headers['token'] = user.uid;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      } catch (e) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => TrainerProfileRegister(),
        ));
      }
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainLoad();
  }
}
