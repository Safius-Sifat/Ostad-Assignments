import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = context.watch<SubjectProvider>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result Summary',
            style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Overview of all added subjects.',
            style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
          ),
          const SizedBox(height: 24),
          _buildSummaryCard(
            context,
            label: 'Total Subjects',
            value: subjectProvider.totalSubjects.toString(),
            icon: Icons.school,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            context,
            label: 'Average Mark',
            value: subjectProvider.averageMark.toString(),
            icon: Icons.calculate,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            context,
            label: 'Passing Subjects',
            value: subjectProvider.passingCount.toString(),
            icon: Icons.check_circle,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            context,
            label: 'Overall Grade',
            value: subjectProvider.overallGrade,
            icon: Icons.grade,
            valueColor: _gradeColor(subjectProvider.overallGrade, colorScheme),
          ),
          const SizedBox(height: 24),
          if (subjectProvider.subjects.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  // Navigate to subject list to review details.
                },
                icon: const Icon(Icons.list),
                label: const Text('View Subject List'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    Color? valueColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              child: Icon(icon),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: valueColor ?? colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
