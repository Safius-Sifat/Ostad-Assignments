import 'package:flutter/material.dart';

class OnboardingIllustration extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final double? height;
  final double? width;

  const OnboardingIllustration({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imagePath,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
