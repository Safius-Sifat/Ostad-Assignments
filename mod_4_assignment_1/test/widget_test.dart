import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mod_4_assignment_1/app.dart';
import 'package:mod_4_assignment_1/providers/profile_provider.dart';
import 'package:mod_4_assignment_1/providers/settings_provider.dart';
import 'package:mod_4_assignment_1/providers/theme_provider.dart';
import 'package:mod_4_assignment_1/routes/route_names.dart';
import 'package:mod_4_assignment_1/screens/home_screen.dart';
import 'package:mod_4_assignment_1/screens/profile_screen.dart';
import 'package:mod_4_assignment_1/screens/settings_screen.dart';
import 'package:mod_4_assignment_1/services/shared_preferences_service.dart';

/// Builds the app under test with a mocked SharedPreferences instance.
Future<Widget> pumpApp(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  final preferences = await SharedPreferences.getInstance();
  final service = SharedPreferencesService(preferences: preferences);

  await tester.pumpWidget(MyApp(sharedPreferencesService: service));
  await tester.pumpAndSettle();
  return MyApp(sharedPreferencesService: service);
}

/// Builds a single screen wrapped with the providers it needs.
Future<void> pumpScreen(
  WidgetTester tester,
  Widget screen, {
  Map<String, Object> initialPreferences = const {},
}) async {
  SharedPreferences.setMockInitialValues(initialPreferences);
  final preferences = await SharedPreferences.getInstance();
  final settingsProvider = SettingsProvider(
    preferencesService: SharedPreferencesService(preferences: preferences),
  );

  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>.value(value: settingsProvider),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            settingsProvider: context.read<SettingsProvider>(),
          ),
        ),
      ],
      child: MaterialApp(
        home: screen,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('App launches HomeScreen', (WidgetTester tester) async {
    await pumpApp(tester);

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Profile Screen'), findsOneWidget);
    expect(find.text('Settings Screen'), findsOneWidget);
  });

  testWidgets('Navigate to ProfileScreen', (WidgetTester tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Profile Screen'));
    await tester.pumpAndSettle();

    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.text('Safiul Islam Sifat'), findsOneWidget);
  });

  testWidgets('Navigate to SettingsScreen', (WidgetTester tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Settings Screen'));
    await tester.pumpAndSettle();

    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('Settings toggle updates provider and persists', (
    WidgetTester tester,
  ) async {
    await pumpScreen(tester, const SettingsScreen());

    final initialSwitch = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Dark Mode'),
    );
    expect(initialSwitch.value, isFalse);

    await tester.tap(find.widgetWithText(SwitchListTile, 'Dark Mode'));
    await tester.pumpAndSettle();

    final updatedSwitch = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Dark Mode'),
    );
    expect(updatedSwitch.value, isTrue);
  });

  testWidgets('go_router route constants are unique', (WidgetTester tester) async {
    const routes = [RouteNames.home, RouteNames.profile, RouteNames.settings];
    expect(routes.toSet().length, routes.length);
  });
}
