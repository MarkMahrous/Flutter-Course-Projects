import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //make the image a little bit transparent
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 340,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 40),
        const Text(
          'Welcome to the Quiz!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 22),
          ),
          icon: const Icon(
            Icons.arrow_right_alt_outlined,
            size: 30,
          ),
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}
