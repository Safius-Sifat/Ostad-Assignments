import 'package:flutter/material.dart';
import 'profile_avatar.dart';
import 'profile_name.dart';
import 'profile_title.dart';
import 'profile_bio.dart';
import 'social_icons.dart';
import 'action_button.dart';

class ProfileCard extends StatelessWidget {
  final String? avatarImage;
  final String name;
  final String title;
  final String bio;
  final List<SocialIcon> socialIcons;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Color cardColor;
  final double borderRadius;
  final EdgeInsets padding;

  const ProfileCard({
    super.key,
    this.avatarImage,
    required this.name,
    required this.title,
    required this.bio,
    required this.socialIcons,
    this.buttonText = 'Connect',
    this.onButtonPressed,
    this.cardColor = const Color(0xFFF5F0F8),
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imagePath: avatarImage,
            radius: 50,
          ),
          const SizedBox(height: 16),
          ProfileName(name: name),
          const SizedBox(height: 8),
          ProfileTitle(title: title),
          const SizedBox(height: 16),
          ProfileBio(bio: bio),
          const SizedBox(height: 24),
          SocialIconsRow(icons: socialIcons),
          const SizedBox(height: 24),
          ActionButton(
            text: buttonText,
            onPressed: onButtonPressed,
          ),
        ],
      ),
    );
  }
}
