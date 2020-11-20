import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';
import 'dart:collection';
import 'package:todo_app/services/database.dart';
// import 'package:todo_app/widgets/task_tile.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(name: 'Buy brain', isDone: false),
  ];

  final DataBase _database; //mock database testing

  TaskData(this._database);

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // List<Task> get testTasks {
  //   return
  // }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  Future<void> loadFromDatabase() async {
    _tasks.add(await _database.loadDatabase());
    notifyListeners();
  }
}
