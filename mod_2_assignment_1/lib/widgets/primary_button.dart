import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double height;
  final bool showArrow;
  final double fontSize;
  final FontWeight fontWeight;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xFF6B7FD4),
    this.foregroundColor = Colors.white,
    this.borderRadius = 16,
    this.height = 56,
    this.showArrow = true,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            ),
            if (showArrow) ...[
              const SizedBox(width: 130),
              const Icon(Icons.arrow_forward, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
