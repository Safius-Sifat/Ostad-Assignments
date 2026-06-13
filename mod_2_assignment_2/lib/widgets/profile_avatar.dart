import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final double radius;
  final Color backgroundColor;

  const ProfileAvatar({
    super.key,
    this.imagePath,
    this.radius = 50,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
      child: imagePath == null
          ? Icon(
              Icons.person,
              size: radius,
              color: Colors.grey[400],
            )
          : null,
    );
  }
}
