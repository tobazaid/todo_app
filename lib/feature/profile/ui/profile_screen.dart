import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_theme.dart';

import 'package:todo_app/feature/profile/ui/widget/profile_headr.dart';
import 'package:todo_app/feature/profile/ui/widget/profile_info.dart';
import 'package:todo_app/feature/profile/ui/widget/profilesetting_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const ProfileHeader(),
            const SizedBox(height: 15),
            const ProfileInfo(),
            const SizedBox(height: 50),
            ProfileSettingsContainer(
              isDarkMode: appThemeMode.value == ThemeMode.dark,
              isLanguageChanged: context.locale.languageCode == 'ar',
              onDarkModeChanged: (value) {
                setState(() {
                  appThemeMode.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                });
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
  }
}