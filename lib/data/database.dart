import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // refer the box
  final _myTodoBox = Hive.box("todo");

  // run this function if this is the first time the app is run
  void createInitialData() {
    toDoList = [
      ["Buy groceries", false],
      ["Do walking", false],
    ];
  }

  // load the data from the database to the list
  void loadData() {
    toDoList = _myTodoBox.get("todo");
  }

  // update the data in the database
  void updateDatabase() {
    _myTodoBox.put("todo", toDoList);
  }
}
