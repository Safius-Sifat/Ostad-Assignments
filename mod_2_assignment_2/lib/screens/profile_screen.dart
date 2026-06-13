import 'package:flutter/material.dart';

import '../widgets/profile_card.dart';
import '../widgets/social_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9BA3A8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ProfileCard(
            name: 'John Doe',
            title: 'App Developer',
            bio:
                'Passionate about creating\nbeautiful and functional websites.\nAlways learning and exploring\nnew technologies.',
            socialIcons: [
              SocialIcon(icon: Icons.facebook, onTap: () {}),
              SocialIcon(icon: Icons.flutter_dash, onTap: () {}),
              SocialIcon(icon: Icons.email, onTap: () {}),
              SocialIcon(icon: Icons.code, onTap: () {}),
            ],
            buttonText: 'Connect',
            onButtonPressed: () {
              // Handle connect button
            },
          ),
        ),
      ),
    );
  }
}
