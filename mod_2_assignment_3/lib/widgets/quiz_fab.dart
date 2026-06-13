import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuizFab extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  const QuizFab({
    super.key,
    this.onPressed,
    this.backgroundColor = const Color(0xFF6B5BCD),
    this.foregroundColor = Colors.white,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:
          onPressed ??
          () {
            Fluttertoast.showToast(
              msg: "hello world",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Icon(icon),
    );
  }
}
