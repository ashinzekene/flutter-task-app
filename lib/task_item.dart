import 'package:flutter/material.dart';

class Task {
  Task(this.text, this.isCompleted);
  final String text;
  bool isCompleted;
}

class TaskItem extends StatelessWidget {
  TaskItem(this._task, this._onClick);

  final Task _task;
  final _onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_task.text),
        onTap: _onClick(_task),
        leading: _task.isCompleted
            ? Icon(
                Icons.check,
                color: Colors.pink,
              )
            : Checkbox(
                value: _task.isCompleted,
                onChanged: null,
              ));
  }
}
