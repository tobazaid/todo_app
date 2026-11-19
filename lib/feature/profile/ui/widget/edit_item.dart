
import 'package:flutter/material.dart';
import 'package:todo_app/feature/profile/ui/edit_profile.dart';
import 'package:todo_app/feature/profile/ui/profile_screen.dart';

class EditProfileItem extends StatelessWidget {
  const EditProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        Icons.edit,
        color: colors.primary,
      ),

      title: const Text('Edit Profile'),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),

      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditProfile(),
          ),
        );
      },
    );
  }
}
