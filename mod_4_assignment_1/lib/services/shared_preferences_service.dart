import 'package:shared_preferences/shared_preferences.dart';

class _PreferenceKeys {
  static const String notificationsEnabled = 'notificationsEnabled';
  static const String darkModeEnabled = 'darkModeEnabled';
  static const String locationEnabled = 'locationEnabled';
}

class SharedPreferencesService {
  SharedPreferencesService({required this._preferences});

  final SharedPreferences _preferences;

  static Future<SharedPreferencesService> create() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesService(preferences: preferences);
  }

  bool getNotificationsEnabled() {
    return _preferences.getBool(_PreferenceKeys.notificationsEnabled) ?? true;
  }

  Future<bool> setNotificationsEnabled(bool value) async {
    return _preferences.setBool(_PreferenceKeys.notificationsEnabled, value);
  }

  bool getDarkModeEnabled() {
    return _preferences.getBool(_PreferenceKeys.darkModeEnabled) ?? false;
  }

  Future<bool> setDarkModeEnabled(bool value) async {
    return _preferences.setBool(_PreferenceKeys.darkModeEnabled, value);
  }

  bool getLocationEnabled() {
    return _preferences.getBool(_PreferenceKeys.locationEnabled) ?? true;
  }

  Future<bool> setLocationEnabled(bool value) async {
    return _preferences.setBool(_PreferenceKeys.locationEnabled, value);
  }
}
