import 'package:flutter/material.dart';

class OnboardingDescription extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double height;
  final TextAlign textAlign;

  const OnboardingDescription({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black87,
    this.height = 1.5,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        height: height,
      ),
    );
  }
}
