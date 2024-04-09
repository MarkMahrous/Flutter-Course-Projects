import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.finishQuiz, {super.key});

  final void Function() finishQuiz;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question> myQuestions = questions;
  int questionIndex = 0;
  List<bool> results = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            myQuestions[questionIndex].question,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...myQuestions[questionIndex].answers.map((answer) => Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: AnswerButton(answer, () {
                  if (questionIndex == myQuestions.length - 1) {
                    widget.finishQuiz();
                  } else {
                    setState(() {
                      questionIndex++;
                    });
                  }
                }),
              )),
        ],
      ),
    );
  }
}
