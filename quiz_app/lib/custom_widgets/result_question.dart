import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(this.questionNumber, this.question, this.correctAnswer,
      this.selectedAnswer,
      {super.key});

  final int questionNumber;
  final String question;
  final String correctAnswer;
  final String selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //circle with question number
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: correctAnswer == selectedAnswer
                ? const Color.fromARGB(255, 45, 127, 235)
                : const Color.fromARGB(255, 124, 9, 190),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              questionNumber.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                "Correct Answer: $correctAnswer",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                "Your Answer: $selectedAnswer",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
