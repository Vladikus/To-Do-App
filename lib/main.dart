import 'package:flutter/material.dart';
import 'package:todo_app/screens/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/services/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (ctx)=> TaskData(DataBase()),
    //     ),],
    return ChangeNotifierProvider(
      create: (context) => TaskData(DataBase()),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
