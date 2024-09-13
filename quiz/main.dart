//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart';
import 'Answer.dart';
import 'Question.dart';
import 'Score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Savastano Lorenzo, 5CIA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questionIndex = 0;
  final questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
      'check': 'Black',
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      'check': 'Lion',
    },
    {
      'questionText': 'Who\'s your favorite ITP instructor?',
      'answers': ['John', 'Carl', 'Kevin', 'James'],
      'check': 'Kevin',
    },
  ];

  void _answerQuestion() {
    setState(() {
      if (_questionIndex >= (questions.length - 1)) {
        _questionIndex = -1;
      }
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Question(
            quest: questions[_questionIndex]['questionText'] as String,
          ),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(
                text: answer,
                action: _answerQuestion,
                check: questions[_questionIndex]['check'] as String);
          }),
          Score(
            text: 'score',
            check: Answer.ok,
          )
        ],
      ),
    );
  }
}
