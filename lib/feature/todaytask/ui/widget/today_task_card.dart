
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class TodayTaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  const TodayTaskCard({
    super.key,
    required this.task,
    required this.onUpdate,
    required this.onDelete,
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
    final status = task.isCompleted ? 'Done' : 'To do';

    final statusColor = task.isCompleted
        ? const Color(0xffDDF7E8)
        : const Color(0xffF0E6FF);

    final statusTextColor = task.isCompleted
        ? Colors.green
        : Colors.deepPurple;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCategoryTranslation(task.category),
                  style: const TextStyle(
                    color: Color(0xff8882A8),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff25213C),
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  task.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status == 'Done' ? 'done'.tr() : 'to_do'.tr(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: onUpdate,
                    icon: Icon(
                      task.isCompleted
                          ? Icons.undo
                          : Icons.check_circle_outline,
                      color: const Color(0xff713FF2),
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
