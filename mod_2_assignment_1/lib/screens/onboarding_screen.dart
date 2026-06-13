import 'package:flutter/material.dart';
import '../widgets/onboarding_title.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_description.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const OnboardingTitle(
                text: 'Make every day\na learning\njourney',
              ),
              const SizedBox(height: 40),
              const OnboardingIllustration(
                imagePath: 'assets/onboarding_illustration.jpeg',
              ),
              const SizedBox(height: 40),
              const OnboardingDescription(
                text: 'An engaging way to master new languages\nand connect with cultures worldwide',
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Start Learning',
                onPressed: () {
                  // Navigate to next screen
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
