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
  String _value = '';
  bool valueCheckbox = false;
  bool valueCheckboxList = false;
  bool valueSwitch = false;
  bool valueSwitchList = false;
  int valueRadioBtn = 0;
  int valueRadioBtnList = 0;
  String datesSelected = '';

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
            Text(_value),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Hello',
                  hintText: 'Mint',
                  icon: Icon(Icons.people)),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),
            Checkbox(
              value: valueCheckbox,
              onChanged: changeValueChbox,
              activeColor: Colors.green,
              checkColor: Colors.blue,
            ),
            CheckboxListTile(
              value: valueCheckboxList,
              onChanged: changeValueChboxList,
              title: Text('Hello world'),
              controlAffinity: ListTileControlAffinity.leading,
              subtitle: Text('Subtitle'),
              secondary: Icon(Icons.archive),
            ),
            makeRadiosBtn(),
            makeRadiosBtnList(),
            Switch(value: valueSwitch, onChanged: changeValueSwitch),
            SwitchListTile(
                value: valueSwitchList,
                onChanged: changeValueSwitchList,
                title: Text(
                  'Hello there',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )),
            ElevatedButton(
              onPressed: selectDate,
              child: Text('click me'),
            )
          ],
        ),
      ),
    );
  }

  void _onChange(String value) {
    setState(() => _value = 'Change: ${value}');
  }

  void _onSubmit(String value) {
    setState(() => _value = 'Submit: ${value}');
  }

  void changeValueChbox(bool? value) {
    if (value != null) {
      setState(() => valueCheckbox = value);
    }
  }

  void changeValueChboxList(bool? value) {
    if (value != null) {
      setState(() => valueCheckboxList = value);
    }
  }

  Widget makeRadiosBtn() {
    List<Radio> radioBtnList = [];
    for (int i = 0; i < 3; i++) {
      radioBtnList.add(Radio(
        value: i,
        groupValue: valueRadioBtn,
        onChanged: _changeValueRadioBtn,
      ));
    }
    Column columns = Column(
      children: radioBtnList,
    );
    return columns;
  }

  void _changeValueRadioBtn(value) {
    if (value != null) {
      setState(() => valueRadioBtn = value);
    }
  }

  Widget makeRadiosBtnList() {
    List<RadioListTile> radioBtnList = [];
    for (int i = 0; i < 3; i++) {
      radioBtnList.add(RadioListTile(
        value: i,
        groupValue: valueRadioBtnList,
        onChanged: _changeValueRadioBtnList,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Radiobtn Title $i'),
        subtitle: Text('sub title'),
      ));
    }
    Column columns = Column(
      children: radioBtnList,
    );
    return columns;
  }

  void _changeValueRadioBtnList(value) {
    if (value != null) {
      setState(() => valueRadioBtnList = value);
    }
  }

  void changeValueSwitch(value) {
    if (value != null) {
      setState(() => valueSwitch = value);
    }
  }

  void changeValueSwitchList(value) {
    if (value != null) {
      setState(() => valueSwitchList = value);
    }
  }

  Future selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2022));
    if (picked != null) {
      setState(() => datesSelected = picked.toString());
    }
    print(datesSelected);
  }
}
