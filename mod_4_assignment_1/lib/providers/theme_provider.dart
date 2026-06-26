import 'package:flutter/material.dart';

import 'settings_provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({required this._settingsProvider}) {
    _settingsProvider.addListener(_onSettingsChanged);
  }

  final SettingsProvider _settingsProvider;

  ThemeMode get themeMode {
    return _settingsProvider.darkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  void _onSettingsChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _settingsProvider.removeListener(_onSettingsChanged);
    super.dispose();
  }
}
