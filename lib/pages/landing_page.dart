import 'package:flutter/material.dart';
import 'quiz_loader.dart';
import './settings.dart';
class LandingPage extends StatelessWidget {
  
  Settings settings = new Settings();

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black87,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Loader(settings.numQuestions))),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.thumbs_up_down, size: 200.0, color: Colors.white,),
            new Text("Infinnity Quiz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight:  FontWeight.bold, fontStyle: FontStyle.italic)),
            new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
            new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new SettingsPage())),
            )
          ],
        ),
      ),     
    );
  }
}