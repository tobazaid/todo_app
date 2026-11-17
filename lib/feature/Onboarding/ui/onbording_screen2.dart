import 'package:flutter/material.dart';
import 'package:todo_app/core/app_button_style.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen3.dart';

class OnbordingScreen2 extends StatelessWidget {
  static const String routeName = "onbording screen 2";

  const OnbordingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Image.asset("assets/image/Intro 2 Track-selection.png"),
            

            Text("Track your progress", style: AppTextStyle.extraBold28),
            SizedBox(height: 10),
            Text("See how far each project has come with"),
            Text("clear progress bars and daily summaries."),
            SizedBox(height: 60),
            ElevatedButton(
              style: AppButtonStyle.nextButton,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  OnbordingScreen3.routeName,
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
