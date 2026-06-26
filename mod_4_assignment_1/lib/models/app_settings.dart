class AppSettings {
  const AppSettings({
    required this.notificationsEnabled,
    required this.darkModeEnabled,
    required this.locationEnabled,
  });

  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final bool locationEnabled;

  AppSettings copyWith({
    bool? notificationsEnabled,
    bool? darkModeEnabled,
    bool? locationEnabled,
  }) {
    return AppSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      locationEnabled: locationEnabled ?? this.locationEnabled,
    );
  }
}
