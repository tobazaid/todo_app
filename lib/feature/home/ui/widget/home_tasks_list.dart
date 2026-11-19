
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class HomeTasksList extends StatefulWidget {
  const HomeTasksList({super.key});

  @override
  State<HomeTasksList> createState() => _HomeTasksListState();
}

class _HomeTasksListState extends State<HomeTasksList> {
  final TaskService _taskService = TaskService();

  late Stream<List<TaskModel>> _tasksStream;

  @override
  void initState() {
    super.initState();
    _tasksStream = _taskService.getTasks();
  }

  Future<void> updateTask(TaskModel task, bool value) async {
    final updatedTask = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      category: task.category,
      isCompleted: value,
      dueDate: task.dueDate,
    );

    await _taskService.updateTask(updatedTask);
  }

  Future<void> deleteTask(TaskModel task) async {
    await _taskService.deleteTask(task.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'my_tasks'.tr(context: context),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: StreamBuilder<List<TaskModel>>(
            stream: _tasksStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "${'error'.tr(context: context)}: ${snapshot.error}",
                  ),
                );
              }

              final tasks = snapshot.data ?? [];

              if (tasks.isEmpty) {
                return Center(
                  child: Text('no_tasks'.tr(context: context)),
                );
              }

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return Card(
                    child: CheckboxListTile(
                      value: task.isCompleted,
                      onChanged: (value) {
                        updateTask(task, value ?? false);
                      },
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(task.description),
                      secondary: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => deleteTask(task),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
