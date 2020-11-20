import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/models/task.dart';


void main() {
  group('TaskData testing', () {
    //using group is a bit redundant here assuming this is a finished app
    TaskData _task;
    
    setUp(() {
      _task = TaskData(null);
    });

    test("Initializes with empty list of Tasks", () {
      expect(_task.taskCount, 0);
    });

    test("Task Added", () {
      _task.addTask(
          'Write some tests!'); //adding a new task with a default isDone status false
      expect(_task.taskCount, 1);
      expect(_task.tasks[0].name, 'Write some tests!');
    });

    test("Checkbox Selected - Status change", () {
      _task.addTask('Write some tests again!');
      expect(_task.tasks[0].isDone, false);

      Task taskToupdate =
          Task(name: _task.tasks[0].name, isDone: _task.tasks[0].isDone);

      _task.updateTask(taskToupdate);
      expect(_task.tasks[0].isDone, false);
    });

    test("Task deleted", () {
      _task.addTask('More tests!');
      expect(_task.taskCount, 1);
      expect(_task.tasks[0].name, 'More tests!');

      Task taskToDelete =
          Task(name: _task.tasks[0].name, isDone: _task.tasks[0].isDone);

      _task.deleteTask(taskToDelete);
      expect(_task.tasks.contains(taskToDelete), false);
    });

    // tearDown(() {});
  });
}
