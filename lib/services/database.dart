import 'package:todo_app/models/task.dart';

class DataBase {
  Future<Task> loadDatabase() async {
    try {
      Future.delayed(Duration(seconds: 1));
      print('Load Database was called');
      return Task(name: 'Loaded from DataBase', isDone: false);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
