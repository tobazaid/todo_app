import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/core/app_theme.dart';

import 'package:todo_app/feature/profile/ui/widget/profile_headr.dart';
import 'package:todo_app/feature/profile/ui/widget/profile_info.dart';
import 'package:todo_app/feature/profile/ui/widget/profilesetting_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeMode,
      builder: (context, currentMode, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const ProfileHeader(),
                const SizedBox(height: 15),
                const ProfileInfo(),
                const SizedBox(height: 50),
                ProfileSettingsContainer(
                  isDarkMode: currentMode == ThemeMode.dark,
                  isLanguageChanged: context.locale.languageCode == 'ar',
                  onDarkModeChanged: (value) {
                    appThemeMode.value = value
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                  onLanguageChanged: (value) {
                    context.setLocale(
                      value ? const Locale('ar') : const Locale('en'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
