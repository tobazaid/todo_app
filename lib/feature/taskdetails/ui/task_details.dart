
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

import 'package:todo_app/feature/taskdetails/ui/widget/task_details_info.dart';
import 'package:todo_app/feature/taskdetails/ui/widget/task_description.dart';
import 'package:todo_app/feature/taskdetails/ui/widget/task_status.dart';
import 'package:todo_app/feature/taskdetails/ui/widget/projects_header.dart';
import 'package:todo_app/feature/taskdetails/ui/widget/projects_info.dart';

class TaskDetails extends StatelessWidget {
  final TaskModel task;

  const TaskDetails({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: colors.onSurface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'task_details'.tr(),
          style: TextStyle(
            color: colors.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskDetailsInfo(task: task),

            const SizedBox(height: 20),

            TaskDescription(
              description: task.description,
            ),

            const SizedBox(height: 20),

            TaskStatus(
              isCompleted: task.isCompleted,
            ),

            const SizedBox(height: 30),

            const ProjectsHeader(),

            const SizedBox(height: 20),

            const ProjectsInfo(),
          ],
        ),
      ),
    );
  }
}
