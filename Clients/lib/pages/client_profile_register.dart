import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/pages/home.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/validators/name_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClientProfileRegister extends StatefulWidget {
  @override
  _ClientProfileRegisterState createState() => _ClientProfileRegisterState();
}

class _ClientProfileRegisterState extends State<ClientProfileRegister> {

  final _form = GlobalKey<FormState>();
  var _clientProfile = ClientModel();
  final _auth = FirebaseAuth.instance;
  final _service = ClientService();

  @override
  Widget build(BuildContext context) {
    DateTime _dateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre seu perfil'),
        centerTitle: true,
      ),
      backgroundColor: mainGreen,
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
                      color: mainBlack,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Dados Pessoais', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),),
                      TextFormField(
                        autofocus: true,
                        decoration:  InputDecoration(
                          hintText: 'Nome', 
                          hintStyle: TextStyle( fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.name = value,
                        validator: nameValidator,
                      ),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Sobrenome', 
                          hintStyle: TextStyle( fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.lastname = value,
                      ),     
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RaisedButton(
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
                                _clientProfile.birthDate = date.toString();
                              });
                            });
                          },
                        ),
                      ),               
                    ],
                  ),
                ),
                Container(
                  decoration:
                    BoxDecoration(
                      color: mainBlack,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  // height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Text('Dados Físicos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Peso', 
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.weight = value,
                      ),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Altura', 
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.height = value,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration:
                    BoxDecoration(
                      color: mainBlack,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  // height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Text('Dados Extras', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Objetivo', 
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.goal = value,
                      ),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Tempo Ativo', 
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.timeActive = value,
                      ),
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Disponibilidade Atual', 
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onSaved: (value) => _clientProfile.timeActive = value,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  onPressed: _salvar,
                  color: mainBlack,
                  splashColor: mainGreen,
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
    );
  }

  _salvar() async {

    if (_form.currentState.validate()){
      _form.currentState.save();
      _clientProfile.uid = (await _auth.currentUser()).uid;
      try {
        final clientProfile = await _service.createClientProfile(_clientProfile);
        print(clientProfile.uid);
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

// clientProfile: _clientProfile,