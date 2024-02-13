import 'package:flutter/material.dart';
import 'package:flutter_todo_app/util/dialog_box.dart';
import 'package:flutter_todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of tasks
  List toDoList = [
    ['Task 1', false],
    ['Task 2', false],
    ['Task 3', false],
  ];

  // controller for the text field
  final _controller = TextEditingController();

  // function to change the checkbox value
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // function to save the new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  // function to create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Text('Todo App'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
