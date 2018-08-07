import 'package:flutter/material.dart';

import './task_item.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks, this._onClick);

  final List<Task> _tasks;
  final _onClick;

  @override
  Widget build(BuildContext context) {
    return ListView(
    children: _tasks.map((task) {
      return TaskItem(task, _onClick);
    }).toList());
  }
}