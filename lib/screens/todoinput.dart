import 'package:flutter/material.dart';
import 'dart:async';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/classes/db_helper.dart';

class ToDoInput extends StatefulWidget {
  @override
  _ToDoInputState createState() => _ToDoInputState();
}

class _ToDoInputState extends State<ToDoInput> {

  TextEditingController controller = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  ToDo instance = ToDo('');

  void showAlert(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controller,
              onChanged: (value) {
                ToDo todo = ToDo(value);
                instance = todo;
              },
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150.0, 16.0, 150.0, 0),
              child: RaisedButton(
                onPressed: () async {
                  Navigator.pop(context, true);
                  int result = await databaseHelper.insertTodo(instance);
                  if(result != 0) {
                    showAlert("Success", "Task added successfully");
                  }
                },
                color: Colors.blueAccent,
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

