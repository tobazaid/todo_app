
import 'package:flutter/material.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';
import 'package:todo_app/feature/taskdetails/ui/task_details.dart';

class CalendarTaskCard extends StatelessWidget {
  final TaskModel task;
  final Future<void> Function(TaskModel, bool) updateTask;
  final Future<void> Function(TaskModel) deleteTask;

  const CalendarTaskCard({
    super.key,
    required this.task,
    required this.updateTask,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      elevation: 0,
      color: theme.cardColor,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TaskDetails(task: task);
              },
            ),
          );
        },

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),

        leading: Checkbox(
          value: task.isCompleted,
          activeColor: colors.primary,
          onChanged: (value) {
            updateTask(task, value ?? false);
          },
        ),

        title: Text(
          task.title,
          style: TextStyle(
            color: colors.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ),

        trailing: IconButton(
          onPressed: () async {
            await deleteTask(task);
          },
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
