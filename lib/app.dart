import 'package:flutter/material.dart';
import 'homepage.dart';

class ToDo extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: ToDoList(title: 'What To Do, What Not To Do'),
    );
  }
}