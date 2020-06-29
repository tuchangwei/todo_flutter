import 'package:flutter/material.dart';
import 'package:todo/models/tasks_data.dart';
import 'package:todo/views/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => TasksData(),
      child: SafeArea(
        child: TasksScreen(),
      ),
    ));
  }
}
