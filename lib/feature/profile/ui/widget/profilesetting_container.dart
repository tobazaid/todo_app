
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';

import 'package:todo_app/feature/profile/ui/widget/edit_item.dart';
import 'package:todo_app/feature/profile/ui/widget/language_item.dart';
import 'package:todo_app/feature/profile/ui/widget/log_out_item.dart';

class ProfileSettingsContainer extends StatelessWidget {
  final bool isDarkMode;
  final bool isLanguageChanged;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onLanguageChanged;

  const ProfileSettingsContainer({
    super.key,
    required this.isDarkMode,
    required this.isLanguageChanged,
    required this.onDarkModeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Column(
        children: [
          const EditProfileItem(),

          const SizedBox(height: 12),

          // Dark Mode
          Row(
            children: [
              Image.asset(
                "assets/image/darkmode.png",
                width: 45,
                height: 45,
              ),

              const SizedBox(width: 5),

              Text(
                'dark_mode'.tr(),
                style: AppTextStyle.bold16,
              ),

              const Spacer(),

              Switch(
                value: isDarkMode,
                activeColor: AppColor.main,
                onChanged: onDarkModeChanged,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Language
          LanguageItem(
            isLanguageChanged: isLanguageChanged,
            onChanged: onLanguageChanged,
          ),

          const SizedBox(height: 12),

          // Logout
          const LogoutItem(),
        ],
      ),
    );
  }
}
