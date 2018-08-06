import 'package:flutter/material.dart';


class Task {
  Task(this.text, this.isCompleted);
  final String text;
  bool isCompleted;
}

class TaskItem extends StatelessWidget {
  TaskItem(this._text, this._isCompleted, _onClick);

  final String _text;
  final bool _isCompleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_text),
      leading: Icon(
        _isCompleted ? Icons.check : Icons.adjust,
        color: _isCompleted ? Colors.pinkAccent: null,
      ),
    );
  }
}