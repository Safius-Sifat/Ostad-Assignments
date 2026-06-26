import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

/// Root screen that hosts the bottom navigation bar and switches between
/// the three feature screens.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = [
    const AddSubjectScreen(),
    const SubjectListScreen(),
    const SummaryScreen(),
  ];

  static final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline),
      activeIcon: Icon(Icons.add_circle),
      label: 'Add',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      activeIcon: Icon(Icons.list),
      label: 'Subjects',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.summarize_outlined),
      activeIcon: Icon(Icons.summarize),
      label: 'Summary',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<NavigationProvider>().selectedIndex;
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Grade Tracker'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: 'Toggle theme',
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          context.read<NavigationProvider>().setIndex(index);
        },
        items: _navItems,
      ),
    );
  }
}
