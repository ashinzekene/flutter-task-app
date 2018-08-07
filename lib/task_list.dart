import 'package:flutter/material.dart';

import './task_item.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks, this._onClick, this._remove);

  final List<Task> _tasks;
  final _onClick;
  final _remove;

  @override
  Widget build(BuildContext context) {
    return ListView(
    children: _tasks.map((task) {
      return TaskItem(task, _onClick, _remove);
    }).toList());
  }
}