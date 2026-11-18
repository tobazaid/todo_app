import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/calendar/ui/calendar_screen.dart';
import 'package:todo_app/feature/home/ui/widget/custom_bottom_nav_bar.dart';
import 'package:todo_app/feature/profile/ui/profile_screen.dart';
import 'package:todo_app/feature/task/ui/tasks_screen.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> get _screens => [
        const HomeTab(),
        const CalendarScreen(),
        const TasksScreen(),
        const ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

// Home Tab
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TaskService _taskService = TaskService();

  late Stream<List<TaskModel>> _tasksStream;

  @override
  void initState() {
    super.initState();
    _tasksStream = _taskService.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 25,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "hello".tr(context: context),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "welcome_back".tr(context: context),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.main,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "today_task_almost_done".tr(context: context),
                      style: AppTextStyle.bold16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Text(
                      "view_task".tr(context: context),
                      style: AppTextStyle.bold16.copyWith(
                        color: AppColor.main,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "my_tasks".tr(context: context),
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
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${"error".tr(context: context)}: ${snapshot.error}",
                      ),
                    );
                  }

                  final tasks = snapshot.data ?? [];

                  if (tasks.isEmpty) {
                    return Center(
                      child: Text("no_tasks".tr(context: context)),
                    );
                  }

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];

                      return Card(
                        child: CheckboxListTile(
                          value: task.isCompleted,
                          onChanged: (value) async {
                            final updatedTask = TaskModel(
                              id: task.id,
                              title: task.title,
                              description: task.description,
                              category: task.category,
                              isCompleted: value ?? false,
                            );
                            await _taskService.updateTask(updatedTask);
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
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await _taskService.deleteTask(task.id);
                            },
                          ),
                        ),
                      );
                    },
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