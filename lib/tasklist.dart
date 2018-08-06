import 'package:flutter/material.dart';

import './taskitem.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks, this.onClick);

  final List<Task> _tasks;
  final onClick;

  // final List<Task> _test_tasks = List.from()
  @override
    Widget build(BuildContext context) {
      Iterable<ListTile> tiles = _tasks.map(
        (Task task) {
          ListTile(
            title: Text(task.text),
            leading: Icon(
              task.isCompleted ? Icons.check : Icons.adjust,
              color: task.isCompleted ? Colors.pinkAccent: null,
            ),
          );
        }
      );
      print(_tasks);
      final List<Widget> lists = ListTile.divideTiles(
        tiles: tiles,
        context: context,
      ).toList();

      return ListView(
        children: lists,
      );
    }
}