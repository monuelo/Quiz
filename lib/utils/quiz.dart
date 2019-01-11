import './question.dart';
import './data.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex;
  int _score;

  Quiz(List data, int qnt) {
    this._questions = data.skip(0).take(qnt).toList();
    this._questions.shuffle();
    this._score = 0;
    this._currentQuestionIndex = -1;
  }

  List<Question> get questions => _questions;
  int get lenght => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  int get score => _score;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= lenght) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}
