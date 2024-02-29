class Task {
  final String name;
  final DateTime deadline;
  bool _isComplete = false;

  Task(this.name, this.deadline);

  bool get isComplete => _isComplete;

  void markComplete() {
    _isComplete = true;
  }
}

class ToDoList {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String name, DateTime deadline) {
    final task = Task(name, deadline);
    _tasks.add(task);
  }

  void markComplete(String taskName) {
    final task = _tasks.firstWhere((task) => task.name == taskName, orElse: () => null);
    if (task != null) {
      task.markComplete();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('To Do List App'),
        ),
        body: ToDoListWidget(),
      ),
    );
  }
}

class ToDoListWidget extends StatefulWidget {
  @override
  _ToDoListWidgetState createState() => _ToDoListWidgetState();
}

class _ToDoListWidgetState extends State<ToDoListWidget> {
  final ToDoList _toDoList = ToDoList();

  final TextEditingController _taskNameController = TextEditingController();
  DateTime _deadline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _taskNameController,
          decoration: InputDecoration(hintText: 'Add a task'),
        ),
        Row(
          children: [
            RaisedButton(
              onPressed: () {
                if (_taskNameController.text.isNotEmpty) {
                  _toDoList.addTask(_taskNameController.text, DateTime.now());
                  _taskNameController.clear();
                  setState(() {});
                }
              },
              child: Text('Add Task'),
            ),
            RaisedButton(
              onPressed: () {
                if (_taskNameController.text.isNotEmpty) {
                  _deadline = DateTime.now().add(Duration(days: 7));
                  _toDoList.addTask(_taskNameController.text, _deadline);
                  _taskNameController.clear();
                  setState(() {});
                }
              },
              child: Text('Add Task with Deadline'),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _toDoList.tasks.length,
            itemBuilder: (context, index) {
              final task = _toDoList.tasks[index];
              return ListTile(
                title: Text(task.name),
                subtitle: Text(DateFormat('dd/MM/yyyy').format(task.deadline)),
                trailing: task.isComplete
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.circle_outlined),
                onTap: () {
                  _toDoList.markComplete(task.name);
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}