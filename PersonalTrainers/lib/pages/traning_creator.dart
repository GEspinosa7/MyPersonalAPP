import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/training_model.dart';
import 'package:my_personal_personaltrainer/services/training_service.dart';
import 'package:my_personal_personaltrainer/widgets/exercises_widget.dart';

import '../utils/colors.dart';
import 'home.dart';

class TrainingCreator extends StatefulWidget {
  final int clientId;

  const TrainingCreator({Key key, @required this.clientId}) : super(key: key);

  @override
  _TrainingCreatorState createState() => _TrainingCreatorState();
}

class _TrainingCreatorState extends State<TrainingCreator> {
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _training = TrainingModel();
  final _trainingService = TrainingService();
  String _trainingKind = 'AB';

  List<Exercises> _exercises = [];
  final nameController = TextEditingController();
  final timesController = TextEditingController();
  final seriesController = TextEditingController();
  final descriptionController = TextEditingController();
  final equipmentController = TextEditingController();

  void _addExercise() {
    if (nameController.text.isEmpty) return;
    setState(() => _exercises.add(Exercises(
          name: nameController.text,
        )));
    nameController.text = 'Sem nome';
    if (timesController.text.isEmpty) return;
    setState(() => _exercises.add(Exercises(
          times: timesController.text,
        )));
    timesController.text = 'Repetições não informadas';
    if (seriesController.text.isEmpty) return;
    setState(() => _exercises.add(Exercises(
          series: seriesController.text,
        )));
    seriesController.text = 'Séries não informadas';
    if (descriptionController.text.isEmpty) return;
    setState(() => _exercises.add(Exercises(
          description: descriptionController.text,
        )));
    descriptionController.text = 'Sem descrição';
    if (equipmentController.text.isEmpty) return;
    setState(() => _exercises.add(Exercises(
          equipment: equipmentController.text,
        )));
    equipmentController.text = 'Sem equipamento';
  }

  void _removeExercise(Exercises exercise) {
    setState(() => _exercises.remove(exercise));
  }

  @override
  Widget build(BuildContext context) {
    DateTime _startDate;
    DateTime _endDate;

    return Scaffold(
      appBar: AppBar(
        title: Text('Treino'),
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
                  decoration: BoxDecoration(
                    color: mainBlack,
                    border: Border.all(color: mainGreen),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(15)),
                  ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Dados Iniciais',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: mainGreen),
                      ),
                      Divider(),
                      DropDownFormField(
                        titleText: 'Tipo',
                        hintText: 'Por favor, selecione uma opção',
                        value: _trainingKind,
                        onSaved: (value) {
                          setState(() {
                            _trainingKind = value;
                            _training.kind = value.toString();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _trainingKind = value;
                            _training.kind = value.toString();
                          });
                        },
                        dataSource: [
                          {
                            "display": "AB",
                            "value": "AB",
                          },
                          {
                            "display": "ABC",
                            "value": "ABC",
                          },
                          {
                            "display": "ABCD",
                            "value": "ABCD",
                          },
                          {
                            "display": "ABCDE",
                            "value": "ABCDE",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Divisão',
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: mainGreen,
                                fontWeight: FontWeight.bold),
                            hintText: 'Ex: 3 dias da semana',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onSaved: (value) => _training.division = value),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                              color: mainGreen,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  _startDate == null
                                      ? 'Data de Inicio'
                                      : _startDate.toString(),
                                  style: TextStyle(fontSize: 15)),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _startDate == null
                                            ? DateTime.now()
                                            : _startDate,
                                        firstDate: DateTime(1800),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _startDate = date;
                                    _training.dateStart = date.toString();
                                  });
                                });
                              },
                            ),
                            RaisedButton(
                              color: mainGreen,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  _endDate == null
                                      ? 'Data de Encerramento'
                                      : _endDate.toString(),
                                  style: TextStyle(fontSize: 15)),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _endDate == null
                                            ? DateTime.now()
                                            : _endDate,
                                        firstDate: DateTime(1800),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _endDate = date;
                                    _training.dateEnd = date.toString();
                                  });
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: mainBlack,
                    border: Border.all(color: mainGreen),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(15)),
                  ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Exercícios',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: mainGreen),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          padding: EdgeInsets.all(5),
                          children: _exercises.map((exercise) {
                            return ExerciseWidget(
                              exercise: exercise,
                              onRemove: _removeExercise,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: FloatingActionButton(
                          onPressed: openForm,
                          tooltip: 'Add Exercício',
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  onPressed: _saveTraining,
                  color: mainBlack,
                  splashColor: mainGreen,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Enviar Treino',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openForm() {
    showDialog(
      context: this.context,
      builder: (context) {
        return Dialog(child: form);
      },
    );
  }

  Widget get form {
    return Container(
      color: mainBlack,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                'Crie seu exercício',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: mainGreen),
              ),
              Divider(),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Qual será o exercício?',
                  ),
                  textInputAction: TextInputAction.go,
                  controller: nameController,
                  onSubmitted: (value) => nameController),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Deseja descrever o execício?',
                  ),
                  textInputAction: TextInputAction.go,
                  controller: descriptionController,
                  onSubmitted: (value) => descriptionController),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantas repetições?',
                  ),
                  textInputAction: TextInputAction.go,
                  controller: timesController,
                  onSubmitted: (value) => timesController),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantas séries?',
                  ),
                  textInputAction: TextInputAction.go,
                  controller: seriesController,
                  onSubmitted: (value) => seriesController),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Qual será o equipamento utilizado?',
                  ),
                  textInputAction: TextInputAction.go,
                  controller: equipmentController,
                  onSubmitted: (value) => equipmentController),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: mainGreen,
                  onPressed: () {
                    _addExercise();
                    Navigator.pop(context);
                  },
                  splashColor: mainBlack,
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveTraining() async {
    _training.clientId = widget.clientId;

    if (_form.currentState.validate()) {
      _form.currentState.save();
      try {
        final training = await _trainingService.createTraining(_training);
        // print(_client.uid);
        print(training.id);
        print("Treinador:");
        print(training.trainerId);
        print("Client:");
        print(training.clientId);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e);
      }
    }
  }
}
