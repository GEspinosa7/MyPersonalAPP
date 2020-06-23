import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/tasks_model.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';


class TaskWidget extends StatelessWidget {
  final Task task;
  final void Function(Task) onRemove;
  final void Function(Task, bool) onCheck;

  TaskWidget({Key key, this.task, this.onRemove, this.onCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: mainGreen,
          border: Border.all(color: mainGreen),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Checkbox(
            checkColor: mainGreen,
            activeColor: mainBlack,
            value: task.done,
            onChanged: (value) => onCheck(task, value),
          ),
          Expanded(
            child: Text(
              task.title,
              style:
                  TextStyle(color: mainBlack),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => onRemove(task),
          )
        ],
      ),
    );
  }
}
