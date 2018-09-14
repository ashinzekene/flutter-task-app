import 'package:flutter/material.dart';

import './task_item.dart';
import './task_list.dart';
import './add_task.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Task List',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new MyHomePage(title: 'Task List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tasks = <Task>[];

  @override
  void initState() {
    super.initState();
    _tasks.add(Task(1, 'Buy something at the market', true));
    _tasks.add(Task(2, 'Finish writing note', false));
    _tasks.add(Task(3, 'Check for updates in project', true));
    _tasks.add(Task(4, 'Buy a milk', false));
    _tasks.add(Task(5, 'Pay for rentage', false));
  }

  void _addTask(String text) {
    final index = _tasks[_tasks.length - 1].ind + 1;
    _tasks.add(Task(index, text, false));
    Navigator.pop(context);
  }

  void _openAddTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AddTaskPage(title: 'Add a New Task', onClick: _addTask)),
    );
  }

  Function _remove(int index) =>
      () => setState(() => _tasks.removeWhere((Task t) => t.ind == index));

  Function _onClick(Task task) {
    return () {
      setState(() {
        task.isCompleted = !task.isCompleted;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 25.0,
        fontStyle: FontStyle.italic);

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: _tasks.length == 0
          ? Center(
              child: Text(
                'You are all done. You can go to rest now...',
                style: _textStyle,
                textAlign: TextAlign.center,
              ),
            )
          : TaskList(_tasks, _onClick, _remove),
      floatingActionButton: new FloatingActionButton(
        onPressed: _openAddTaskPage,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
