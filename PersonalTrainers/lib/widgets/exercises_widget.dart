import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/training_model.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercises exercise;
  final void Function(Exercises) onRemove;

  ExerciseWidget({Key key, this.exercise, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: mainGreen,
          border: Border.all(color: mainGreen),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: Colors.redAccent),
            onPressed: () => onRemove(exercise),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Nome',
                    style: TextStyle(
                      color: mainBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Descrição',
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Repetições',
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Séries',
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Equipamento',
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    exercise.name.toString(),
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    exercise.description.toString(),
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    exercise.times.toString(),
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    exercise.series.toString(),
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    exercise.equipment.toString(),
                    style: TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
