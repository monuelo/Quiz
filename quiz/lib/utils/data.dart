import 'dart:async';
import 'dart:convert';
import 'question.dart';
import 'package:http/http.dart' as http;
import 'question.dart';

class Data{
  List data;
  
  Future<http.Response> fetchPost() async{
    final response = await http.get('https://boolean-quiz.firebaseio.com/.json');
    data = JSON.decode(response.body);
    List responseJson = json.decode(response.body); 
    data = responseJson;
    exportQuestions();
    return response;
  }

  int exportQuestions(){
    if (data == null){
    Future<http.Response> a = fetchPost();
    } else {
      List<Question> questions = new List();
      for (int i = 0; i < data.length; i++){
        questions.add(new Question(data[i]['question'], data[i]['answer']));
      }
    }
  }
}
