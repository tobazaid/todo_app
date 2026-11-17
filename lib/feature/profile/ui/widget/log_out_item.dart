import 'package:flutter/material.dart';
import 'package:todo_app/core/app_text_style.dart';

class LogoutItem extends StatelessWidget {
  const LogoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/image/logout.png",
          width: 45,
          height: 45,
        ),

        const SizedBox(width: 5),

        Text(
          "LOg Out",
          style: AppTextStyle.bold16.copyWith(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}