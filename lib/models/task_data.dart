import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  String task;
  List<Task> _tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskLength {
    notifyListeners();
    return _tasksList.length;
  }

  UnmodifiableListView<Task> get tasksList {
    return UnmodifiableListView(_tasksList);
  }

  void addTask(String taskName) {
    final task = Task(name: taskName);
    _tasksList.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
