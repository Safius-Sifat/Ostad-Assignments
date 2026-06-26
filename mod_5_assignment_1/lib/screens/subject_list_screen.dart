import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = context.watch<SubjectProvider>().subjects;
    final colorScheme = Theme.of(context).colorScheme;

    if (subjects.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 64,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            Text(
              'No subjects added yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Dismissible(
          key: ValueKey('${subject.name}_$index'),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: colorScheme.error,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.delete,
              color: colorScheme.onError,
            ),
          ),
          onDismissed: (_) {
            context.read<SubjectProvider>().removeSubject(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${subject.name} removed')),
            );
          },
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.onPrimaryContainer,
                child: Text(subject.grade),
              ),
              title: Text(
                subject.name,
                style: TextStyle(color: colorScheme.onSurface),
              ),
              subtitle: Text(
                'Mark: ${subject.mark}',
                style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              trailing: Text(
                subject.grade,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _gradeColor(subject.grade, colorScheme),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _gradeColor(String grade, ColorScheme colorScheme) {
    switch (grade) {
      case 'A':
        return colorScheme.tertiary;
      case 'B':
        return colorScheme.primary;
      case 'C':
        return colorScheme.secondary;
      case 'F':
        return colorScheme.error;
      default:
        return colorScheme.onSurface;
    }
  }
}
