import 'package:flutter/material.dart';
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(),
      ),
      child: Column(
        children: [
          EditProfileItem(),

          const SizedBox(height: 12),

          DarkModeItem(
            isDarkMode: isDarkMode,
            onChanged: onDarkModeChanged,
          ),

          const SizedBox(height: 12),

          LanguageItem(
            isLanguageChanged: isLanguageChanged,
            onChanged: onLanguageChanged,
          ),

          const SizedBox(height: 12),

          const LogoutItem(),
        ],
      ),
    );
  }
}
