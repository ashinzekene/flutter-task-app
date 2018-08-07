import 'package:flutter/material.dart';

class Task {
  Task(this.ind, this.text, this.isCompleted);
  final int ind;
  final String text;
  bool isCompleted;
}

class TaskItem extends StatelessWidget {
  TaskItem(this._task, this._onClick, this._remove);

  final Task _task;
  final Function _onClick;
  final Function _remove;
  final TextStyle _taskTextStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0);


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
              ),
        trailing: _task.isCompleted
            ? IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: _remove(_task.ind),
              )
            : null);
  }
}
