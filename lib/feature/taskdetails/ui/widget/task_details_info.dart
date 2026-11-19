
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class TaskDetailsInfo extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsInfo({
    super.key,
    required this.task,
  });

  String getCategoryTranslation(String category) {
    switch (category) {
      case 'Work':
        return 'work'.tr();
      case 'Personal':
        return 'personal'.tr();
      case 'Study':
        return 'study'.tr();
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getCategoryTranslation(task.category),
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            task.title,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
