import 'package:flutter/material.dart';

class OnboardingTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;

  const OnboardingTitle({
    super.key,
    required this.text,
    this.fontSize = 36,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
