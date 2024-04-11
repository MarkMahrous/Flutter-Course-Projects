import 'package:flutter/material.dart';
import 'package:quiz_app/custom_widgets/result_question.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.startQuiz, this.selectedAnswers, {super.key});

  final void Function() startQuiz;
  final List<String> selectedAnswers;
  final List<Question> myQuestions = questions;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < myQuestions.length; i++) {
      summary.add({
        'questionNumber': i + 1,
        'question': myQuestions[i].question,
        'correctAnswer': myQuestions[i].answers[0],
        'selectedAnswer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summary = getSummary();
    final numCorrectAnswers = summary.where((element) {
      return element['correctAnswer'] == element['selectedAnswer'];
    }).length;
    final numTotalQuestions = myQuestions.length;

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You Answered $numCorrectAnswers out of $numTotalQuestions Correctly!',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: summary.map((data) {
                  return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: QuestionResult(
                          data['questionNumber'] as int,
                          data['question'] as String,
                          data['correctAnswer'] as String,
                          data['selectedAnswer'] as String));
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.restart_alt),
            onPressed: startQuiz,
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
