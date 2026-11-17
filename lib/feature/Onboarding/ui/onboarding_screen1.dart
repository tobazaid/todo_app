import 'package:flutter/material.dart';
import 'package:todo_app/core/app_button_style.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen2.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String routeName = "onbording 1";

  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          
            Image.asset("assets/image/Intro 1 Plan-selection.png"),
            Text("Plan your tasks", style: AppTextStyle.extraBold28),
            SizedBox(height: 10),
            Text("Create projects and break them into small"),
            Text("tasks you can finish one by one."),
            SizedBox(height: 60),
            ElevatedButton(
              style: AppButtonStyle.nextButton,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  OnbordingScreen2.routeName,
                );
              },
              child: const Text("Next", style: AppTextStyle.bold16),
            ),
          ],
        ),
      ),
    );
  }
}