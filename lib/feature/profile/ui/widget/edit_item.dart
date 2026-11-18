
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';

class EditProfileItem extends StatelessWidget {
  const EditProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/image/Profile-selection.png",
          width: 45,
          height: 45,
        ),
        const SizedBox(width: 5),
        Text(
          "edit_profile".tr(),
          style: AppTextStyle.bold16,
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}

class DarkModeItem extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const DarkModeItem({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/image/darkmode.png",
          width: 45,
          height: 45,
        ),
        const SizedBox(width: 5),
        Text(
          "dark_mode".tr(),
          style: AppTextStyle.bold16,
        ),
        const Spacer(),
        Switch(
          value: isDarkMode,
          activeColor: AppColor.main,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
