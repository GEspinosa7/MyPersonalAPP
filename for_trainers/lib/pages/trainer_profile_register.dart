import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/home.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';

class TrainerProfileRegister extends StatefulWidget {
  @override
  _TrainerProfileRegisterState createState() => _TrainerProfileRegisterState();
}

class _TrainerProfileRegisterState extends State<TrainerProfileRegister> {

  final _form = GlobalKey<FormState>();
  var _trainerProfile = TrainerModel();
  final _auth = FirebaseAuth.instance;
  final _service = TrainerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil', textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => _trainerProfile.name = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => _trainerProfile.lastname = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Data de nascimento'),
                  onSaved: (value) => _trainerProfile.birthDate = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tempo Atuando'),
                  onSaved: (value) => _trainerProfile.timeActing = value,
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Qualificações'),
                  onSaved: (value) => _trainerProfile.qualifications = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diponibilidade Atual'),
                  onSaved: (value) => _trainerProfile.availability = value,
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Preço Inicial'),
                //   onSaved: (value) => _trainerProfile.price = value as int,
                // ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(onPressed: _salvar, child: Text('Salvar'), color: mainGreen,),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: mainBlack,
    );
  }

  _salvar() async {
    _form.currentState.save();
    _trainerProfile.uid = (await _auth.currentUser()).uid;

    try {
      final trainerProfile = await _service.createTrainerProfile(_trainerProfile);
      print(trainerProfile);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }

  }
}