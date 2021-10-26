import 'package:flutter/material.dart';
import 'dart:async';

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
  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Some info here.',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'))
              ],
            ),
          );
        });
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
            Text('Add Widgets Here'),
            ElevatedButton(
                onPressed: _showBottom, child: const Text('Click me')),
            ElevatedButton(
                onPressed: () =>
                    _showAlertDialog(context, 'Hi, Lucas! Everything is OK?'),
                child: const Text('Show alert message')),
          ],
        ),
      ),
    );
  }

  Future _showAlertDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'No'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Yes'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
