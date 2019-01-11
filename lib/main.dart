import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';
import './pages/settings.dart';

void main() => runApp(new MaterialApp(
  theme: new ThemeData.dark(),
  home: new LandingPage(),
));