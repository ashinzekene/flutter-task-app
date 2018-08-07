import 'package:flutter/material.dart';

class Task {
  Task(this.text, this.isCompleted);
  final String text;
  bool isCompleted;
}

class TaskItem extends StatelessWidget {
  TaskItem(this._task, this._onClick);

  final Task _task;
  final Function _onClick;
  final TextStyle _taskTextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_task.text, style: _taskTextStyle),
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
