import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key, this.title, this.onClick}) : super(key: key);

  final String title;
  final Function onClick;

  @override
  _AddTaskStorePage createState() => new _AddTaskStorePage();
}

class _AddTaskStorePage extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();

  void _checkValue() {
    if (_controller.text.length > 3) {
      widget.onClick(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _buttonTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 23.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Add a task',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
                labelText: 'New Task',
              ),
              autofocus: true,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: RaisedButton(
              padding: EdgeInsets.all(15.0),
              onPressed: _checkValue,
              color: Theme.of(context).primaryColor,
              elevation: 3.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              child: Text('Create Task', style: _buttonTextStyle),
            )
          )
        ]),
      ),
    );
  }
}
