import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2.0,
          wordSpacing: 5.0,
          shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ]),
    );
  }
}
