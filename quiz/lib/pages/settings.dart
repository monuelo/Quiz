import 'package:flutter/material.dart';

class Settings {
  int _numQuestions = 5;

  double set setNum(double n){
    this._numQuestions = n.toInt();
  }

  int get numQuestions => _numQuestions;
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text("SETTINGS", style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: new NumQuestionsSelect(),
    );
  }
}

class NumQuestionsSelect extends StatefulWidget {
  @override
  State createState() => new NumQuestionsSelectState();  
}

class NumQuestionsSelectState extends State<NumQuestionsSelect> {
  Settings settings = new Settings();

  double _value = 5.0;


  void _onChanged(double value){
    setState(() {
          _value = value;
          settings.setNum = value;
          print(settings.numQuestions);
      });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(40.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new Slider(
                  min: 3.0,
                  max: 10.0,
                  value: _value, onChanged: (double value){_onChanged(value);},
                  activeColor: Colors.white,
                  inactiveColor: Colors.white24,
                  divisions: 7,
                  label: _value.toString()
                ),
                new Container(
            padding: new EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.all(const Radius.circular(1.0)),
              boxShadow: [new BoxShadow(color: Colors.white30, offset: new Offset(0.0, 6.0))]
            ),
            child: new Text("Questões por Partida", style: new TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

