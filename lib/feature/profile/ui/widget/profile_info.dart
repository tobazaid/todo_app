
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColor.main,
          child: const Icon(
            Icons.person_2,
            size: 30,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 15),

        Text(
          "Abdetawab Zaid",
          style: AppTextStyle.bold16,
        ),

        const Text("Abdo@gmail.com"),
      ],
    );
  }
}
