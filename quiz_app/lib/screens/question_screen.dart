import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.finishQuiz, this.answerQuestion, {super.key});

  final void Function() finishQuiz;
  final void Function(String) answerQuestion;

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
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...myQuestions[questionIndex]
              .getShuffledAnswers()
              .map((answer) => Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: AnswerButton(answer, () {
                      if (answer == myQuestions[questionIndex].answers[0]) {
                        results.add(true);
                        print(results);
                      } else {
                        results.add(false);
                        print(results);
                      }
                      widget.answerQuestion(answer);
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
