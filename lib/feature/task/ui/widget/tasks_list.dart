
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';
import 'package:todo_app/feature/todaytask/ui/widget/task_card.dart';

class TasksList extends StatelessWidget {
  final Stream<List<TaskModel>> tasksStream;
  final TaskService taskService;

  const TasksList({
    super.key,
    required this.tasksStream,
    required this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return StreamBuilder<List<TaskModel>>(
      stream: tasksStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: colors.primary,
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "${'error'.tr(context: context)}: ${snapshot.error}",
              style: TextStyle(color: colors.error),
            ),
          );
        }

        final tasks = snapshot.data ?? [];

        if (tasks.isEmpty) {
          return Center(
            child: Text(
              'no_tasks'.tr(context: context),
              style: TextStyle(
                fontSize: 18,
                color: colors.onSurfaceVariant,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TaskCard(
                task: task,
                onChanged: (value) async {
                  final updatedTask = TaskModel(
                    id: task.id,
                    title: task.title,
                    description: task.description,
                    category: task.category,
                    isCompleted: value,
                    dueDate: task.dueDate,
                  );

                  await taskService.updateTask(updatedTask);
                },
                onDelete: () async {
                  await taskService.deleteTask(task.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
