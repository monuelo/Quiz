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

import './score_page.dart';
import './settings.dart';

class QuizPage extends StatefulWidget {
  List data;
  int numQuestions;
  QuizPage(this.data, this.numQuestions);

  @override
  State createState() => new QuizPageState(this.data, this.numQuestions);
}


class QuizPageState extends State<QuizPage> {
  
  List data;
  int numQuestions;

  static List<Question> aux;
  QuizPageState(this.data, this.numQuestions){
    aux = new List();
    for(int i = 0; i < data.length; i++){
      aux.add(new Question(data[i]['question'], data[i]['answer']));
    }
  }

  Question currentQuestion;
  Quiz quiz;

    
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShoudBeVisible  = false;

  @override
  void initState() {
    super.initState();
    quiz = new Quiz(aux, this.numQuestions);
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