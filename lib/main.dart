import 'package:flutter/material.dart';

import './taskitem.dart';
import './tasklist.dart';

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

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tasks.add(Task('Buy something at the market', true));
    _tasks.add(Task('Finish writing note', false));
    _tasks.add(Task('Check for updates in project', true));
    _tasks.add(Task('Buy a milk', false));
    _tasks.add(Task('Pay for rent', false));
  }

  _onClick(Task task) {
    return () {
      setState(() {
        task.isCompleted = !task.isCompleted;
      });
    };
  }

  ListView fakeBody() {
    return ListView(
      children: _tasks.map((task) {
        return ListTile(
          title: Text(task.text),
          onTap: _onClick(task),
          leading: task.isCompleted ?
            Icon(
              Icons.check,
              color: Colors.pink,
            ) :
            Checkbox(
              value: task.isCompleted,
              onChanged: null,
            )
        );
      }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: fakeBody(), //TaskList(_tasks, _onClick),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
