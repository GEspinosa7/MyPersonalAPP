import 'package:MyPersonal/pages/home.dart';
import 'package:MyPersonal/pages/login.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/utils/http.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'client_profile_register.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _auth = FirebaseAuth.instance;
  final _service = ClientService();

  @override
  void initState() {
    super.initState();
    _navegate();
  }

  _navegate() async {
    final user = await _auth.currentUser();

    if (user != null) {
      try {
        await _service.getClientProfile(user.uid);
        Http.instance.options.headers['token'] = user.uid;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      } catch (e) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ClientProfileRegister(),
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
