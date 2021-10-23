import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _name = 'Hello world';
  String _lastName = 'Hernández';

  void _changeName(value) {
    setState(() {
      _name = value;
    });
  }

  void _addLastName() {
    if(!_name.contains(_lastName)) {
      setState(() {
        _name = "${_name} ${_lastName}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Name here'),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text(_name),
              ElevatedButton(
                onPressed: () => _changeName('Hi, Luis'),
                onLongPress: _addLastName,
                child: Text('Click me'),
              )
            ],
          ),
        ));
  }
}
