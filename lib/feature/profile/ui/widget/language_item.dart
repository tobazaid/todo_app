
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';

class LanguageItem extends StatelessWidget {
  final bool isLanguageChanged;
  final ValueChanged<bool> onChanged;

  const LanguageItem({
    super.key,
    required this.isLanguageChanged,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/image/language.png",
          width: 45,
          height: 45,
        ),

        const SizedBox(width: 5),

        Text(
          "Language",
          style: AppTextStyle.bold16,
        ),

        const Spacer(),

        Switch(
          value: isLanguageChanged,
          activeColor: AppColor.main,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
