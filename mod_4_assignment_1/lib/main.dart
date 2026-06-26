import 'package:flutter/material.dart';
import 'app.dart';
import 'services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferencesService = await SharedPreferencesService.create();

  runApp(MyApp(sharedPreferencesService: sharedPreferencesService));
}
