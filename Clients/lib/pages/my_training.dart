import 'package:MyPersonal/components/exercise_card.dart';
import 'package:MyPersonal/models/training_model.dart';
import 'package:MyPersonal/services/training_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTraining extends StatefulWidget {
  @override
  _MyTrainingState createState() => _MyTrainingState();
}

class _MyTrainingState extends State<MyTraining> {
  TrainingModel training;
  final service = TrainingService();
  List<Exercise> _exercises = [];

  @override
  void initState() {
    super.initState();
    _loadTraining();
  }

  _loadTraining() async {
    final resp = await service.getTraining();
    setState(() {
      training = resp;
      _exercises = training.exercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBlack,
        appBar: AppBar(
            title: Text('Meu Treino', textAlign: TextAlign.center),
            centerTitle: true,
            backgroundColor: mainBlack),
        body: training == null ? noTraining() : yesTraining());
  }

  Widget noTraining() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.announcement,
            size: 90,
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
              color: mainBlack,
              border: Border.all(color: mainGreen),
              borderRadius: const BorderRadius.all(const Radius.circular(15)),
            ),
            child: Center(
                child: Text(
              'Parece que seu personal ainda não criou nenhum treino para você!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
          ),
        ],
      ),
    );
  }

  Widget yesTraining() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Container(
          //   width: double.infinity,
          //   margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          //   padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          //   child: RaisedButton(
          //     color: Colors.lightBlue[200],
          //     onPressed: () => null,
          //     splashColor: mainGreen,
          //     child: Text(
          //       'Pergunte ao Personal',
          //       style: TextStyle(
          //           color: mainBlack,
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 20),
          //   child: RaisedButton(
          //     color: mainBlack,
          //     onPressed: () => showAlertDialog1(context),
          //     splashColor: mainGreen,
          //     child: Text(
          //       'Pontuar',
          //       style: TextStyle(
          //         color: mainGreen,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainBlack,
                border: Border.all(color: mainGreen),
                borderRadius: const BorderRadius.all(const Radius.circular(15)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    child: Text(
                      'Dados do Treino',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Tipo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        training.kind.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                      // Text(
                      //   'Duração',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 17),
                      // ),
                      // Text(
                      //   training.dateEnd.toString(),
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontSize: 17),
                      // ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Divisão',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          training.division,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainBlack,
              border: Border.all(color: mainGreen),
              borderRadius: const BorderRadius.all(const Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  child: Text(
                    'Exercícios',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Divider(),
                // RaisedButton(
                //   color: Colors.blue,
                //   onPressed: () => print(training.exercises.length),
                //   splashColor: Colors.blueGrey,
                //   child: Text(
                //     'OK',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
                Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: mainGreen,
                    border: Border.all(color: mainGreen),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(15)),
                  ),
                  child: Container(
                    child: ListView(
                      children: _exercises.map((e) {
                        return ExerciseCard(
                          exercise: e,
                          clickCard: () => null,
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // showKeepAsking(BuildContext context) {
  //   Widget photoButton = FlatButton(
  //     child: Text("Enviar Foto", style: TextStyle(color: Colors.blue)),
  //     onPressed: () {
  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Gallery();}));
  //     },
  //   );

  //   Widget confirmButton = FlatButton(
  //     child: Text("Continuar sem foto", style: TextStyle(color: Colors.orange)),
  //     onPressed: () {},
  //   );

  //   AlertDialog alert = AlertDialog(
  //     title: Text("Deseja comprovar com uma foto?"),
  //     content: Text("Com isso você poderá acompanhar sua evolução"),
  //     backgroundColor: mainBlack,
  //     actions: [
  //       confirmButton,
  //       photoButton,
  //     ],
  //   );

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  // showAlertDialog1(BuildContext context) {
  //   Widget cancelButton = FlatButton(
  //     child: Text("Não", style: TextStyle(color: Colors.red)),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );

  //   Widget confirmButton = FlatButton(
  //     child: Text("Sim, pontuar", style: TextStyle(color: Colors.green)),
  //     onPressed: () {
  //       showKeepAsking(context);
  //     },
  //   );

  //   AlertDialog alert = AlertDialog(
  //     title: Text("Antes disso.."),
  //     content: Text("Você realmente treinou hoje?"),
  //     backgroundColor: mainBlack,
  //     actions: [
  //       cancelButton,
  //       confirmButton,
  //     ],
  //   );

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
