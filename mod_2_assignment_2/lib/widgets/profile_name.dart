import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  final String name;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const ProfileName({
    super.key,
    required this.name,
    this.fontSize = 32,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
