import 'package:flutter/material.dart';
import 'package:todo_app/feature/Onboarding/onboarding_screen1.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen1(),
    );
  }
}