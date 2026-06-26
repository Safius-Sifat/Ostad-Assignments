import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/profile_provider.dart';
import 'providers/settings_provider.dart';
import 'providers/theme_provider.dart';
import 'routes/app_router.dart';
import 'services/shared_preferences_service.dart';

/// Root widget that wires up dependencies and providers.
///
/// [sharedPreferencesService] is injected from [main.dart] so the service can
/// be created once during app startup.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.sharedPreferencesService,
  });

  final SharedPreferencesService sharedPreferencesService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(
            preferencesService: sharedPreferencesService,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProxyProvider<SettingsProvider, ThemeProvider>(
          create: (context) => ThemeProvider(
            settingsProvider: context.read<SettingsProvider>(),
          ),
          update: (_, settingsProvider, previousThemeProvider) {
            return previousThemeProvider ??
                ThemeProvider(settingsProvider: settingsProvider);
          },
        ),
      ],
      child: const _AppRouter(),
    );
  }
}

/// Internal widget that consumes the theme and exposes the router.
class _AppRouter extends StatelessWidget {
  const _AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;

    return MaterialApp.router(
      title: 'Module 4 Assignment 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      routerConfig: createRouter(),
    );
  }
}
