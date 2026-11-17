import 'package:flutter/material.dart';
import 'package:todo_app/core/app_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Profile",
          style: AppTextStyle.extraBold28,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            size: 30,
          ),
        ),
      ],
    );
  }
}
