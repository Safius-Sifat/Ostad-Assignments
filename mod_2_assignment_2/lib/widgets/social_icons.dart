import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color color;

  const SocialIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 28,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}

class SocialIconsRow extends StatelessWidget {
  final List<SocialIcon> icons;
  final double spacing;

  const SocialIconsRow({
    super.key,
    required this.icons,
    this.spacing = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons.asMap().entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(
            right: entry.key < icons.length - 1 ? spacing : 0,
          ),
          child: entry.value,
        );
      }).toList(),
    );
  }
}
