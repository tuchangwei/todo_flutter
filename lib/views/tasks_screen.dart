import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 40, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 40,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${Provider.of<TasksData>(context).tasksCount} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Consumer<TasksData>(
                builder: (context, data, child) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final task = data.tasks[index];
                      return ListTile(
                        title: Text(
                          task.name,
                          style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: Checkbox(
                          value: task.isDone,
                          onChanged: (changed) {
                            data.updateTask(task);
                          },
                        ),
                      );
                    },
                    itemCount: data.tasksCount,
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
