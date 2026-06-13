import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const ProfileTitle({
    super.key,
    required this.title,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
