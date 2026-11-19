
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

import 'widget/today_header.dart';
import 'widget/week_dates_list.dart';
import 'widget/task_filter_list.dart';
import 'widget/today_tasks_list.dart';

class ToDayTask extends StatefulWidget {
  static const String routeName = "to day task";

  const ToDayTask({super.key});

  @override
  State<ToDayTask> createState() => _ToDayTaskState();
}

class _ToDayTaskState extends State<ToDayTask> {
  final TaskService _taskService = TaskService();

  late Stream<List<TaskModel>> _tasksStream;

  int selectedDateIndex = 2;
  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    _tasksStream = _taskService.getTasks();
  }

  List<TaskModel> filterTasks(List<TaskModel> tasks) {
    switch (selectedFilter) {
      case "Done":
        return tasks.where((task) => task.isCompleted).toList();
      case "To do":
        return tasks.where((task) => !task.isCompleted).toList();
      case "In Progress":
        return [];
      default:
        return tasks;
    }
  }

  Future<void> updateTask(TaskModel task) async {
    final updatedTask = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      category: task.category,
      isCompleted: !task.isCompleted,
      dueDate: task.dueDate,
    );

    await _taskService.updateTask(updatedTask);
  }

  Future<void> deleteTask(TaskModel task) async {
    await _taskService.deleteTask(task.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      body: SafeArea(
        child: Column(
          children: [
            const TodayHeader(),

            WeekDatesList(
              selectedDateIndex: selectedDateIndex,
              onDateSelected: (index) {
                setState(() {
                  selectedDateIndex = index;
                });
              },
            ),

            const SizedBox(height: 12),

            TaskFilterList(
              selectedFilter: selectedFilter,
              onFilterChanged: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),

            const SizedBox(height: 12),

            Expanded(
              child: StreamBuilder<List<TaskModel>>(
                stream: _tasksStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff713FF2),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${'error'.tr()}: ${snapshot.error}",
                      ),
                    );
                  }

                  final allTasks = snapshot.data ?? [];
                  final tasks = filterTasks(allTasks);

                  return TodayTasksList(
                    tasks: tasks,
                    isInProgress: selectedFilter == "In Progress",
                    onUpdate: updateTask,
                    onDelete: deleteTask,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
