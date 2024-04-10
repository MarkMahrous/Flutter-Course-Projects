import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.startQuiz, this.selectedAnswers, this.myQuestions,
      {super.key});

  final void Function() startQuiz;
  final List<String> selectedAnswers;
  final List<Question> myQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the question and its answer and selected answer
        for (var i = 0; i < myQuestions.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Text(
                  myQuestions[i].question,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Correct Answer: ${myQuestions[i].answers[0]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Your Answer: ${selectedAnswers[i]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ElevatedButton(
          onPressed: startQuiz,
          child: const Text('Start Again'),
        ),
      ],
    );
  }
}
