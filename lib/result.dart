import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore == 3) {
      resultText = 'Your Result is : 3';
    } else if (resultScore == 2) {
      resultText = 'Your Result is : 2';
    } else if (resultScore == 1) {
      resultText = 'Your Result is : 1';
    } else {
      resultText = 'Your Result is : 0';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.red,
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
