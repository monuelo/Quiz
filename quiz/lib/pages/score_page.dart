import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {
  
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
          new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
          new Padding(padding: EdgeInsets.only(bottom: 30.0)),
          new IconButton(
            icon: new Icon(Icons.play_circle_filled),
            color: Colors.white,
            iconSize: 100.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
          ),
          new Text("Play Again", style: new TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}