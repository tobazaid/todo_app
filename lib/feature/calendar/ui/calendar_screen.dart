
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/calendar/ui/widget/calendar_header.dart';
import 'package:todo_app/feature/calendar/ui/widget/calendar_tasks_list.dart';
import 'package:todo_app/feature/calendar/ui/widget/custom_calendar_date_picker.dart';
import 'package:todo_app/feature/calendar/ui/widget/selected_date_header.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final TaskService _taskService = TaskService();

  late Stream<List<TaskModel>> _tasksStream;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tasksStream = _taskService.getTasks();
  }

  bool isSameDate(DateTime? first, DateTime second) {
    if (first == null) return false;

    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: const CalendarHeader(),

      body: StreamBuilder<List<TaskModel>>(
        stream: _tasksStream,
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
                "${'error'.tr()}: ${snapshot.error}",
                style: TextStyle(color: colors.onSurface),
              ),
            );
          }

          final tasks = snapshot.data ?? [];

          final selectedTasks = tasks.where((task) {
            return isSameDate(task.dueDate, selectedDay);
          }).toList();

          return Column(
            children: [

              CustomCalendarDatePicker(
                focusedDay: focusedDay,
                selectedDay: selectedDay,
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    focusedDay = focused;
                  });
                },
                onPageChanged: (focused) {
                  focusedDay = focused;
                },
              ),

              SelectedDateHeader(
                selectedDay: selectedDay,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: CalendarTasksList(
                  tasks: selectedTasks,
                  updateTask: updateTask,
                  deleteTask: deleteTask,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
