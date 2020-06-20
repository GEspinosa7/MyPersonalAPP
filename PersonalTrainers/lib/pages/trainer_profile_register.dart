import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/home.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/validators/name_validator.dart';

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
    DateTime _dateTime;


    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre seu perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Container(
                  decoration:
                    BoxDecoration(
                      border: Border.all(color: mainGreen),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  // height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Dados Pessoais'),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(labelText: 'Nome'),
                        onSaved: (value) => _trainerProfile.name = value,
                        validator: nameValidator,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Sobrenome', hoverColor: mainGreen),
                        onSaved: (value) => _trainerProfile.lastname = value,
                      ),    
                      Divider(),  
                      RaisedButton(
                        color: mainGreen,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _dateTime == null ? 'Data de Nascimento' : _dateTime.toString(),
                          style: TextStyle(fontSize: 15)
                        ),
                        onPressed: () {
                          showDatePicker(  
                            context: context,
                            initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                            firstDate: DateTime(1800),
                            lastDate: DateTime(3000)
                          ).then((date) {
                            setState(() {
                              _dateTime = date;
                              _trainerProfile.birthDate = date.toString();
                            });
                          });
                        },
                      ),               
                    ],
                  ),
                ),
                Container(
                  decoration:
                    BoxDecoration(
                      border: Border.all(color: mainGreen),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  // height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Text('Dados Profissionais'),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Tempo Atuando'),
                        onSaved: (value) => _trainerProfile.timeActing = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Qualificações'),
                        maxLines: 5,
                        onSaved: (value) => _trainerProfile.qualifications = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Diponibilidade Atual'),
                        maxLines: 5,
                        onSaved: (value) => _trainerProfile.availability = value,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: 'Preço Inicial'),
                        onSaved: (value) => _trainerProfile.price = value,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  onPressed: _salvar,
                  color: mainGreen,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Salvar Perfil',
                    style: TextStyle(fontSize: 20),),
                ),
                // RaisedButton(onPressed: _sair, child: Text('sair'), color: mainGreen,),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: mainBlack,
    );
  }

  _salvar() async {

    if (_form.currentState.validate()){
      _form.currentState.save();
      _trainerProfile.uid = (await _auth.currentUser()).uid;
      try {
        final trainerProfile = await _service.createTrainerProfile(_trainerProfile);
        print(trainerProfile.uid);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e);
      }
    }
  }

  //   _sair() async {
  //   _auth.signOut();
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => HomePage(),
  //   ));
  // }
}

// trainerProfile: _trainerProfile,