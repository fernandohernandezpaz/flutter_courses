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
  int value = 0;
  String currentDate = 'Click in float button to get the current date and time';
  String _buttonClicked = '';
  List<BottomNavigationBarItem> bottomBar = [];

  int index = 0;
  String bottomBarItemClicked = '';

  void add() => setState(() => value++);

  void remove() => setState(() => value--);

  void getCurrentDate() {
    setState(() => currentDate = DateTime.now().toString());
  }

  void onClick(String buttonClicked) {
    setState(() => _buttonClicked = buttonClicked);
  }

  @override
  void initState() {
    bottomBar.add(
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'));
    bottomBar.add(
        BottomNavigationBarItem(icon: Icon(Icons.weekend), label: 'Weekend'));
    bottomBar.add(
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here the toolbar'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(onPressed: add, icon: Icon(Icons.add)),
          IconButton(onPressed: remove, icon: Icon(Icons.remove)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getCurrentDate,
          backgroundColor: Colors.lightBlue,
          mini: true,
          child: Icon(Icons.timer)),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text('Hello drawer'),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context), child: Text('Close'))
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(onPressed: () => onClick('Btn 1'), icon: Icon(Icons.timer)),
        IconButton(onPressed: () => onClick('Btn 2'), icon: Icon(Icons.people)),
        IconButton(onPressed: () => onClick('Btn 3'), icon: Icon(Icons.map)),
      ],
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Text(
              value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.5),
            ),
            Text(
              currentDate,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.5),
            ),
            Text(
              "The button clicked is: $_buttonClicked",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.5),
            ),
            Text(
              "The botton bar button clicked is: $bottomBarItemClicked",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.5),
            ),
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBar,
        fixedColor: Colors.blue,
        currentIndex: index,
        onTap: (int indexItemClicked) {
          setState(() {
            index = indexItemClicked;
            bottomBarItemClicked = indexItemClicked.toString();
          });
        },
      ),
    );
  }
}
