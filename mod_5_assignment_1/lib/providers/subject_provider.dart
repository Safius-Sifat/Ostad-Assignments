import 'package:flutter/foundation.dart';
import '../models/subject.dart';

/// Provider that owns the list of subjects and exposes operations to
/// add, remove, and summarize them.
class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  int get totalSubjects => _subjects.length;

  /// Returns the average mark rounded to one decimal place.
  /// Returns 0.0 when there are no subjects.
  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final total = _subjects.fold<int>(
      0,
      (sum, subject) => sum + subject.mark,
    );
    return double.parse((total / _subjects.length).toStringAsFixed(1));
  }

  /// Overall grade based on the average mark.
  String get overallGrade {
    final average = averageMark;
    if (average >= 80) return 'A';
    if (average >= 65) return 'B';
    if (average >= 50) return 'C';
    return 'F';
  }

  /// The number of subjects that are passing.
  int get passingCount {
    return _subjects.where((subject) => subject.isPassing).length;
  }

  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void removeSubject(int index) {
    if (index < 0 || index >= _subjects.length) return;
    _subjects.removeAt(index);
    notifyListeners();
  }
}
