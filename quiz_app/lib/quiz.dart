import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeWidget = "start";

  void startQuiz() {
    setState(() {
      activeWidget = "question";
    });
  }

  void finishQuiz() {
    setState(() {
      activeWidget = "result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: activeWidget == "start"
                ? StartScreen(startQuiz)
                : activeWidget == "question"
                    ? QuestionScreen(finishQuiz)
                    : ResultScreen(startQuiz),
          ),
        ),
      ),
    );
  }
}
