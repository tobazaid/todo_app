import 'package:flutter/material.dart';
import 'package:todo_app/feature/Onboarding/ui/onboarding_screen1.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen2.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen3.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen4.dart';
import 'package:todo_app/feature/home/ui/home_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen1.routeName,
      routes: {
        OnboardingScreen1.routeName: (context) => OnboardingScreen1(),
        OnbordingScreen2.routeName: (context) =>OnbordingScreen2(),
        OnbordingScreen3.routeName:(context) => OnbordingScreen3(),
        OnbordingScreen4.routeName:(context) => OnbordingScreen4(),
        HomeScreen.routeName:(context) => HomeScreen()
             
      },
    );
  }
}