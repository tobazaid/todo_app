import 'package:flutter/material.dart';
import 'package:todo_app/feature/profile/ui/widget/profile_headr.dart';
import 'package:todo_app/feature/profile/ui/widget/profile_info.dart';
import 'package:todo_app/feature/profile/ui/widget/profilesetting_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;
  bool isLanguageChanged = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),

            const ProfileHeader(),

            const SizedBox(height: 15),

            const ProfileInfo(),

            const SizedBox(height: 50),

            ProfileSettingsContainer(
              isDarkMode: isDarkMode,
              isLanguageChanged: isLanguageChanged,
              onDarkModeChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              onLanguageChanged: (value) {
                setState(() {
                  isLanguageChanged = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
