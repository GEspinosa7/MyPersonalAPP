import 'dart:math';

class Task {
  int id;
  String title;
  bool done;
  Task({this.title, this.done = false}) {
    id = Random().nextInt(100000);
  }
}
