import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final EdgeInsets padding;

  const SectionTitle({
    super.key,
    required this.title,
    this.fontSize = 24,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
