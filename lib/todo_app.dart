import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:todo_app/core/app_theme.dart';
import 'package:todo_app/feature/Onboarding/ui/onboarding_screen1.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen2.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen3.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen4.dart';
import 'package:todo_app/feature/home/ui/home_screen.dart';
import 'package:todo_app/feature/todaytask/ui/to_day_task.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeMode,
      builder: (context, currentMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: currentMode,

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          initialRoute: OnboardingScreen1.routeName,
          routes: {
            OnboardingScreen1.routeName: (context) => OnboardingScreen1(),
            OnbordingScreen2.routeName: (context) => OnbordingScreen2(),
            OnbordingScreen3.routeName: (context) => OnbordingScreen3(),
            OnbordingScreen4.routeName: (context) => OnbordingScreen4(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ToDayTask.routeName:(context) => ToDayTask()
          },
        );
      },
    );
  }
}