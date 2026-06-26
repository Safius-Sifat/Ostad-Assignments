/// Represents a school subject with a name and a mark.
///
/// The mark is stored as a private field and exposed through a public
/// grade getter that follows the standard grading scale.
class Subject {
  Subject({required this.name, required this._mark});

  final String name;
  final int _mark;

  int get mark => _mark;

  /// Returns the letter grade based on the mark.
  ///
  /// A ≥ 80, B ≥ 65, C ≥ 50, otherwise F.
  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }

  /// Whether the subject is considered passing (mark ≥ 50).
  bool get isPassing => _mark >= 50;
}
