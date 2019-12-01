import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'How many months do we have in a year?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '12', 'score': 1},
        {'text': '15', 'score': 0},
      ],
    },
    {
      'questionText': 'How many days do we have in a week?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '7', 'score': 1},
        {'text': '15', 'score': 0},
      ],
    },
    {
      'questionText': 'How many days are there in a year?',
      'answers': [
        {'text': '365', 'score': 1},
        {'text': '265', 'score': 0},
        {'text': '465', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We Have more questions !');
    } else {
      print('Thanks !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Testing'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
