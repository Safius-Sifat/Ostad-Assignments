import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  final String bio;
  final double fontSize;
  final Color color;
  final double height;
  final TextAlign textAlign;

  const ProfileBio({
    super.key,
    required this.bio,
    this.fontSize = 16,
    this.color = Colors.black87,
    this.height = 1.5,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      bio,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        height: height,
      ),
    );
  }
}
