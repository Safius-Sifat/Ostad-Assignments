import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color borderColor;
  final Color selectedColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CategoryChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.borderColor = Colors.black,
    this.selectedColor = Colors.black,
    this.textColor = Colors.black,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? selectedColor : borderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          color: isSelected ? selectedColor.withValues(alpha: 0.1) : Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? selectedColor : textColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
