import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/classes/db_helper.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<ToDo> todoList;
  int count = 0;

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<ToDo>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todoList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if(todoList == null) {
      todoList = List<ToDo>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(this.todoList[index].task),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  databaseHelper.deleteTodo(todoList[index].id);
                  updateListView();
                },
              )
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/input');
          updateListView();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
