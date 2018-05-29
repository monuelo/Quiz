import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../utils/data.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import '../pages/score_page.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}


class QuizPageState extends State<QuizPage> {
  List data, temp;
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShoudBeVisible  = false;


  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull('https://boolean-quiz.firebaseio.com/.json'),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
      temp = JSON.decode(response.body);
    });
    data = new List<Question>();
    for(int i = 0; i < temp.length; i++) {
      String question = temp[i]['question'];
      bool answer = temp[i]['answer'];
      data.add(new Question(question, answer));
    }
    quiz = new Quiz(data);
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShoudBeVisible = true;
    });
  } 

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),            
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShoudBeVisible ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.lenght == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder:  (BuildContext context) => new ScorePage(quiz.score, quiz.lenght)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShoudBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container(),
      ],
    );
  }
}