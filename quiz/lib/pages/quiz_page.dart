import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import '../pages/score_page.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}


class QuizPageState extends State<QuizPage> {

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

  @override
  void initState() {
    super.initState();
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