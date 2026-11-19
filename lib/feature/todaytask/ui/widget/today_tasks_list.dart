
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';
import 'today_task_card.dart';

class TodayTasksList extends StatelessWidget {
  final List<TaskModel> tasks;
  final bool isInProgress;
  final Function(TaskModel) onUpdate;
  final Function(TaskModel) onDelete;

  const TodayTasksList({
    super.key,
    required this.tasks,
    required this.isInProgress,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (isInProgress) {
      return Center(
        child: Text(
          'add_task_status_message'.tr(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }

    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'no_tasks_found'.tr(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return TodayTaskCard(
          task: task,
          onUpdate: () => onUpdate(task),
          onDelete: () => onDelete(task),
        );
      },
    );
  }
}
