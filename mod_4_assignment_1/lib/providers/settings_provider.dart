import 'package:flutter/foundation.dart';
import '../models/app_settings.dart';
import '../services/shared_preferences_service.dart';

/// Provider that owns the app's settings state and persists changes
/// through [SharedPreferencesService].
class SettingsProvider extends ChangeNotifier {
  SettingsProvider({required this._preferencesService}) {
    _loadSettings();
  }

  final SharedPreferencesService _preferencesService;

  AppSettings _settings = const AppSettings(
    notificationsEnabled: true,
    darkModeEnabled: false,
    locationEnabled: true,
  );

  AppSettings get settings => _settings;

  bool get notificationsEnabled => _settings.notificationsEnabled;
  bool get darkModeEnabled => _settings.darkModeEnabled;
  bool get locationEnabled => _settings.locationEnabled;

  void _loadSettings() {
    _settings = AppSettings(
      notificationsEnabled: _preferencesService.getNotificationsEnabled(),
      darkModeEnabled: _preferencesService.getDarkModeEnabled(),
      locationEnabled: _preferencesService.getLocationEnabled(),
    );
    notifyListeners();
  }

  Future<void> setNotificationsEnabled(bool value) async {
    if (_settings.notificationsEnabled == value) return;
    await _preferencesService.setNotificationsEnabled(value);
    _settings = _settings.copyWith(notificationsEnabled: value);
    notifyListeners();
  }

  Future<void> setDarkModeEnabled(bool value) async {
    if (_settings.darkModeEnabled == value) return;
    await _preferencesService.setDarkModeEnabled(value);
    _settings = _settings.copyWith(darkModeEnabled: value);
    notifyListeners();
  }

  Future<void> setLocationEnabled(bool value) async {
    if (_settings.locationEnabled == value) return;
    await _preferencesService.setLocationEnabled(value);
    _settings = _settings.copyWith(locationEnabled: value);
    notifyListeners();
  }
}
