import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 111, 43, 228),
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      onPressed: onTap,
      child: Text(answerText),
    );
  }
}
