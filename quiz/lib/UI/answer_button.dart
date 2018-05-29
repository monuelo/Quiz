import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {  
    return new Expanded(
      child: new Material( // True Button
          color: _answer ? Colors.black : Colors.white,
          child: new InkWell(
            onTap: () => _onTap(),
            child: new Center(
              child: new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Icon(_answer ? Icons.thumb_up : Icons.thumb_down, size: 130.0, color: _answer ? Colors.white : Colors.black),
                // new Text(_answer ? "True" : "False", style: new TextStyle(color: (_answer) ? Colors.white : Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              ),
            ),
          ),
        ),
      );
    }
}