import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final _authFirestore = Firestore.instance;

class TrainerProfileManagement {
  storeNewTrainer(trainer, context) {
    _authFirestore.collection('/trainers').add({
      'email': trainer.email,
      'uid': trainer.uid
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/home_page');
    }).catchError((e) {
      print(e);
    });
  }
}