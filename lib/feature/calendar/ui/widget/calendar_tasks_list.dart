
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/calendar/ui/widget/calendar_task_card.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class CalendarTasksList extends StatelessWidget {
  final List<TaskModel> tasks;
  final Future<void> Function(TaskModel, bool) updateTask;
  final Future<void> Function(TaskModel) deleteTask;

  const CalendarTasksList({
    super.key,
    required this.tasks,
    required this.updateTask,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 55,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(
              'no_tasks_for_this_day'.tr(),
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: tasks.length,

      itemBuilder: (context, index) {
        final task = tasks[index];

        return CalendarTaskCard(
          task: task,
          updateTask: updateTask,
          deleteTask: deleteTask,
        );
      },
    );
  }
}
