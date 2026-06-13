import 'package:flutter/material.dart';
import 'category_chip.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String)? onCategorySelected;
  final EdgeInsets padding;
  final double spacing;

  const CategorySelector({
    super.key,
    required this.categories,
    this.selectedCategory,
    this.onCategorySelected,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          return Padding(
            padding: EdgeInsets.only(
              right: entry.key < categories.length - 1 ? spacing : 0,
            ),
            child: CategoryChip(
              label: entry.value,
              isSelected: selectedCategory == entry.value,
              onTap: () => onCategorySelected?.call(entry.value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
