import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/services/database.dart';
import 'package:mockito/mockito.dart';

class MockDataBase extends Mock implements DataBase {}

void main() {
  MockDataBase _mockDataBase = MockDataBase();

  TaskData _task;
  setUp(() {
    _task = TaskData(_mockDataBase);
  });

  test('Mock DataBase test', () async {
    when(_mockDataBase.loadDatabase()).thenAnswer(
      (realInvocation) => Future.value(
        Task(name: 'Task From Mock', isDone: false),
      ),
    );
    await _task.loadFromDatabase();
    expect(_task.tasks[0].name, 'Task From Mock');
  });
}
