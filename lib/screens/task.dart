import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  static bool openedModalSheet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        // tooltip: 'Add Button',
        elevation: 5,
        // key: Key('add'),
        child: const Icon(Icons.add),
        onPressed: () {
          openedModalSheet = true;
          print(openedModalSheet);
          showModalBottomSheet(
            context: context,
            builder: (context) {
              // AddTaskScreen();
              return WillPopScope(
                onWillPop: () async {
                  openedModalSheet = !openedModalSheet;
                  
                  print(openedModalSheet);
                  return true;
                },
                child: AddTaskScreen(),
              );
            },

//                SingleChildScrollView(
//              child: Container(
//                padding: EdgeInsets.only(
//                    bottom: MediaQuery.of(context).viewInsets.bottom),
//                child: AddTaskScreen(), //AddTaskScreen
//              ), //Container

//              isScrollControlled: false,
//            ),
          );
        },
      ),

//                AddTaskScreen(),
//          );
//        },
//      ),

//

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ), //Icon
                  backgroundColor: Colors.white,
                  radius: 30,
                ), //CircleAvatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To-Do',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {
                        // TaskData().loadFromDatabase();
                        Provider.of<TaskData>(context, listen: false)
                            .loadFromDatabase();
                      },
                    ),
                  ],
                ), //Text
                Text(
                  Provider.of<TaskData>(context).taskCount == 1
                      ? '${Provider.of<TaskData>(context).taskCount} Task'
                      : '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ), //Text
              ], //Widget
            ),
          ), //Container
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: TasksList(),
            ), //Container of Expanded
          ) //Expanded
        ],
      ), //Column
    );
  }
}
