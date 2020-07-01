import 'package:flutter/material.dart';
import 'package:todoapp/screens/todoinput.dart';
import 'package:todoapp/screens/todolist.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ToDoList(),
      '/input': (context) => ToDoInput(),
    },
  ));
}
