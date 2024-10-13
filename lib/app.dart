import 'package:flutter/material.dart';
import 'package:todo_list_for_me/app_theme.dart';
import 'package:todo_list_for_me/fiature/onboarding/presentation/onboarding_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appThemeLightData,
        themeMode: ThemeMode.system,
        home: const OnboardingScreen());
  }
}
