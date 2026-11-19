
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProjectsInfo extends StatelessWidget {
  const ProjectsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            Icons.folder_outlined,
            color: colors.primary,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'organize_projects_message'.tr(),
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
