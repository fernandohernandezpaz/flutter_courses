import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'dart:io';

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
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  List _countries = [];

  void _getData() async {
    var _url = 'https://restcountries.com/v3.1/all';
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
    }
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Name here'),
        ),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Column(
            children: <Widget>[
              Expanded(child: Image.asset('images/master_chief.jpg')),
              Expanded(
                  child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/5906/5906721.png')),
              const Text('Please login'),
              Row(
                children: <Widget>[
                  const Text('Username: '),
                  Expanded(
                      child: TextField(
                    controller: _user,
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  const Text('Password: '),
                  Expanded(
                      child: TextField(
                    controller: _password,
                    obscureText: true,
                  ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                      onPressed: () => print('Login ${_user.text}'),
                      child: const Text('Log in'),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 50)))),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: const <Widget>[
                      Text('Hellow world'),
                      Text('How are you'),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  // String key = _countries.keys.elementAt(index);
                  return Row(
                    children: <Widget>[
                      Text('$index: '),
                      Text('${_countries[index]['name']['common']}'),
                    ],
                  );
                },
                itemCount: _countries.length,
              ))
            ],
          )),
        ));
  }
}
