import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/subject.dart';
import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: _AddSubjectForm(),
    );
  }
}

class _AddSubjectForm extends StatefulWidget {
  const _AddSubjectForm();

  @override
  State<_AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<_AddSubjectForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final mark = int.parse(_markController.text.trim());

    context.read<SubjectProvider>().addSubject(
          Subject(name: name, mark: mark),
        );

    _nameController.clear();
    _markController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Subject added successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add a new subject',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter the subject name and mark to calculate the grade.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Subject Name',
              hintText: 'e.g. Mathematics',
              prefixIcon: Icon(Icons.book),
            ),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Subject name cannot be empty';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _markController,
            decoration: const InputDecoration(
              labelText: 'Mark',
              hintText: 'e.g. 85',
              prefixIcon: Icon(Icons.percent),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a mark';
              }
              final mark = int.tryParse(value.trim());
              if (mark == null) {
                return 'Mark must be a number';
              }
              if (mark < 0 || mark > 100) {
                return 'Mark must be between 0 and 100';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => _submit(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Subject'),
            ),
          ),
        ],
      ),
    );
  }
}
