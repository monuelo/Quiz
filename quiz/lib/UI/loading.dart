import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Dialog(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            new Padding(padding: new EdgeInsets.symmetric(vertical: 20.0),),
            new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              strokeWidth: 9.0,
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new Text("Loading", style: new TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            new Padding(padding: new EdgeInsets.symmetric(vertical: 20.0))
          ],
        ),
      ),
    );
  }
} 