import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/question.dart';

import './quiz_page.dart';

import '../UI/loading.dart';

class Loader extends StatefulWidget {
  int numQuestions;
  Loader(this.numQuestions);
  
  @override
  State createState() => new LoaderState(this.numQuestions);
}

class LoaderState extends State<Loader> {
  
  List data;
  int numQuestions;

  LoaderState(this.numQuestions);

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull('https://boolean-quiz.firebaseio.com/.json'),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
    data = json.decode(response.body);
    // List aux = new List();
    // for(int i = 0; i < temp.length; i++) {
    //   aux.add( new Question(temp[0]['question'], temp[0]['answer']));
    // }
    // data = aux;
    });
  }

  @override
  void initState(){
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return (data == null) ? new Loading() :  new QuizPage(data, this.numQuestions);
  }
}