import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savastano Lorenzo, 5CIA',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  var questionIndex = 0;
  var scoreCount = 0;
  var countErrors = 0;
  var countSkips = 0;

  final listQuestions = [
    {
      'question': 'Italia',
      'answer': [
        'assets/united-kingdom.png',
        'assets/italy.png',
        'assets/netherlands.png',
        'assets/germany.png'
      ],
      'correct': 'assets/italy.png',
    },
    {
      'question': 'Regno Unito',
      'answer': [
        'assets/united-kingdom.png',
        'assets/italy.png',
        'assets/netherlands.png',
        'assets/germany.png'
      ],
      'correct': 'assets/united-kingdom.png',
    },
    {
      'question': 'Spagna',
      'answer': [
        'assets/united-kingdom.png',
        'assets/spain.png',
        'assets/netherlands.png',
        'assets/germany.png'
      ],
      'correct': 'assets/spain.png',
    },
    {
      'question': 'Germania',
      'answer': [
        'assets/united-kingdom.png',
        'assets/italy.png',
        'assets/netherlands.png',
        'assets/germany.png'
      ],
      'correct': 'assets/germany.png',
    },
    {
      'question': 'Paesi Bassi',
      'answer': [
        'assets/united-kingdom.png',
        'assets/italy.png',
        'assets/netherlands.png',
        'assets/germany.png'
      ],
      'correct': 'assets/netherlands.png',
    }
  ];

  void _answerQuestion(String answer) {
    setState(() {
      if (answer == listQuestions[questionIndex]['correct'] as String) {
        scoreCount += 30;
        countErrors = 0;
        countSkips = 0;
      } else {
        countErrors++;
        if (countErrors == 2) {
          scoreCount -= 15;
        }
      }
      questionIndex = (questionIndex + 1) % listQuestions.length;
    });
  }

  void _restartQuiz() {
    setState(() {
      questionIndex = 0;
      scoreCount = 0;
      countSkips = 0;
      countErrors = 0;
    });
  }

  void _nextQuestion() {
    setState(() {
      countSkips++;
      if (countSkips <= 2) {
        questionIndex = (questionIndex + 1) % listQuestions.length;
        scoreCount = scoreCount - 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Question(
              text: listQuestions[questionIndex]['question'] as String,
            ),
            ...(listQuestions[questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(
                action: () {
                  _answerQuestion(answer);
                },
                text: answer,
                correct: (answer ==
                    listQuestions[questionIndex]['correct'] as String),
              );
            }),
            Text(
              'score: $scoreCount',
            ),
            const Text(
              'correct answer: 30',
            ),
            ElevatedButton(
              onPressed: () {
                _nextQuestion();
              },
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, textStyle: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _restartQuiz();
        },
        tooltip: 'Restart',
        child: const Text('restart'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer(
      {super.key,
      required this.action,
      required this.text,
      required this.correct});

  final Function() action;
  final String text;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Image.asset(
          text,
          width: 70,
          height: 70,
        ),
        onTap: () {
          String result = '';
          if (correct) {
            result = 'assets/OK2.png';
          } else {
            result = 'assets/wrong.png';
          }

          showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (ctx) => AlertDialog(
              content: InkWell(
                onTap: () {
                  action();
                  Navigator.of(ctx).pop(true);
                },
                child: Image.asset(result),
              ),
            ),
          );
        },
      ),
    );
  }
}
