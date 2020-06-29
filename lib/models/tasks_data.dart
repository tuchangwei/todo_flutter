import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: "buy milk"),
    Task(name: "buy bread"),
    Task(name: "buy food")
  ];
  int get tasksCount => _tasks.length;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
