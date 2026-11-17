import 'package:flutter/material.dart';
import 'package:todo_app/core/app_button_style.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/home/ui/home_screen.dart';

class OnbordingScreen4 extends StatelessWidget {
  static const String routeName = "onbording screen 4";
  const OnbordingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.asset("assets/image/onbording4.png"),
          Text("Task Management &",style: AppTextStyle.extraBold28,),
          Text("To-Do List",style: AppTextStyle.extraBold28,),
          SizedBox(height: 10,),
          Text("This productive tool is designed to help you"),
          Text("better manage your task project-wise"),
          Text("conveniently!"),
          SizedBox(height: 60,),
            ElevatedButton(
                style: AppButtonStyle.nextButton,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HomeScreen.routeName,
                  );
                },
                child: const Text("Let's Start", style: AppTextStyle.bold16),
              ),
        ],),
      ),
    );
  }
}
