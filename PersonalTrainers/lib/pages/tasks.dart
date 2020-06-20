import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/tasks_model.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/widgets/tasks_widget.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  List<Task> _tasks = [];
  final textController = TextEditingController();

  void _sort() {
    setState(() => _tasks.sort((t1, t2) => t1.done ? 1 : 0));
  }

  void _addTask() {
    if (textController.text.isEmpty) return;
    setState(() => _tasks.add(Task(title: textController.text)));
    _sort();
    textController.text = '';
    Navigator.of(context).pop();
  }

  void _removerTask(Task task) {
    setState(() => _tasks.remove(task));
  }

  void _marcarTask(Task task, bool done) {
    setState(() => task.done = done);
    _sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas'), centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: _tasks.map((task) {
          return TaskWidget(
            task: task,
            onRemove: _removerTask,
            onCheck: _marcarTask,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void abrirFormulario() {
    showDialog(
      context: this.context,
      builder: (context) {
        return Dialog(child: form);
      },
    );
  }

  Widget get form {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'O que tem pra fazer?',
          suffix: IconButton(
            onPressed: _addTask,
            icon: Icon(Icons.send, color: mainGreen),
          ),
        ),
        textInputAction: TextInputAction.go,
        controller: textController,
        onSubmitted: (_) => _addTask(),
      ),
    );
  }
}
