import 'package:flutter/material.dart';
//import 'package:path/path.dart' as path;
//import 'package:sqflite/sqflite.dart';

class ToDoList extends StatefulWidget {
  ToDoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List <String> _todoItems = [];

  void _addToDoItem(String task) {
    if(task.length < 0){
    setState(() => _todoItems.add(task));
    }
  }

  Widget _buildToDoList(){
    return new ListView.builder(
      // itemBuilder will be automatically be called as many times as it takes for the
      // list to fill up its available space, which is most likely more than the
      // number of todo items we have. So, we need to check the index is OK.
        // ignore: missing_return
        itemBuilder: (context, index) {
          if(index < _todoItems.length) {
        return _buildToDoItem(_todoItems[index]);
        }
      },
    );
  }

  Widget _buildToDoItem(String todoText){
    return new ListTile(
      title: new Text(todoText),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add a note',
        child: Icon(Icons.add),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  void _pushAddTodoScreen(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            return new Scaffold(
              appBar: AppBar(
                title: new Text('Add a new Task'),
              ),
              body: new TextField(
                autofocus: true,
                autocorrect: true,
                onSubmitted: (val){
                  _addToDoItem(val);
                  Navigator.pop(context);
                },
                decoration: new InputDecoration(
                  hintText: 'Enter Something You Want To Do',
                  contentPadding: const EdgeInsets.all(16.0)
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.save),
              ),
            );
          }
      ),
    );
  }
}