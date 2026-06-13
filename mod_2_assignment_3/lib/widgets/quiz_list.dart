import 'package:flutter/material.dart';
import 'quiz_card.dart';

class QuizItem {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  QuizItem({
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

class QuizList extends StatelessWidget {
  final List<QuizItem> quizzes;
  final EdgeInsets padding;
  final double spacing;

  const QuizList({
    super.key,
    required this.quizzes,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: quizzes.length,
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemBuilder: (context, index) {
        final quiz = quizzes[index];
        return QuizCard(
          title: quiz.title,
          subtitle: quiz.subtitle,
          onTap: quiz.onTap,
        );
      },
    );
  }
}
