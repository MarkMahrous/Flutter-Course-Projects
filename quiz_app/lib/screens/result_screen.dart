import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: startQuiz,
      child: const Text('Start Again'),
    );
  }
}
