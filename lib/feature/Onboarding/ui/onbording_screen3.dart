import 'package:flutter/material.dart';
import 'package:todo_app/core/app_button_style.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/Onboarding/ui/onbording_screen4.dart';

class OnbordingScreen3 extends StatelessWidget {
  static const String routeName = "on bording screen 3";
  const OnbordingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/image/onbording3.png"),
            Text("Stay on schedule", style: AppTextStyle.extraBold28),
            SizedBox(height: 10),
            Text("Pick dates, set priorities and get a clear view "),
            Text("of what is due today."),
            SizedBox(height: 60),
            ElevatedButton(
              style: AppButtonStyle.nextButton,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  OnbordingScreen4.routeName,
                );
              },
              child: const Text("Continue", style: AppTextStyle.bold16),
            ),
          ],
        ),
      ),
    );
  }
}
