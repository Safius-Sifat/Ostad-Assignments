import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;

  const ActionButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xFF4A90E2),
    this.foregroundColor = Colors.white,
    this.borderRadius = 12,
    this.height = 50,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
