import 'package:flutter/material.dart';
import '../widgets/quiz_app_bar.dart';
import '../widgets/section_title.dart';
import '../widgets/category_selector.dart';
import '../widgets/quiz_list.dart';
import '../widgets/quiz_fab.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  String? selectedCategory;

  final List<String> categories = [
    'Science',
    'Math',
    'History',
    'Sports',
  ];

  final List<Map<String, String>> quizzes = [
    {
      'title': 'Flutter Basics',
      'subtitle': '10 Questions',
    },
    {
      'title': 'General Knowledge',
      'subtitle': '20 Questions',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const QuizAppBar(
        title: 'Quiz Home',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Choose Category',
            padding: EdgeInsets.all(16),
          ),
          CategorySelector(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = selectedCategory == category ? null : category;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: QuizList(
              quizzes: quizzes.map((quiz) => QuizItem(
                title: quiz['title']!,
                subtitle: quiz['subtitle']!,
                onTap: () {
                  // Navigate to quiz detail
                },
              )).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: const QuizFab(),
    );
  }
}
