// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  static const _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Yellow', 'score': 30},
        {'text': 'White', 'score': 40}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Monkey', 'score': 10},
        {'text': 'Rabbit', 'score': 20},
        {'text': 'Lion', 'score': 30},
        {'text': 'Snake', 'score': 40}
      ],
    },
    {
      'questionText': 'Who\'s your favorite singer?',
      'answers': [
        {'text': 'Eric', 'score': 10},
        {'text': 'Max', 'score': 20},
        {'text': 'Leo', 'score': 30},
        {'text': 'Vick', 'score': 40}
      ],
    }
  ];

  // var dummy = const ['test'];
  // dummy.add('test2'); // can not add to an unmodifiable list
  // _questions = []; // Constant variables can't be assigned a value.

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more _questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
