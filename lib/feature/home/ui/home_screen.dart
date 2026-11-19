
import 'package:flutter/material.dart';
import 'package:todo_app/feature/calendar/ui/calendar_screen.dart';
import 'package:todo_app/feature/home/ui/widget/custom_bottom_nav_bar.dart';
import 'package:todo_app/feature/home/ui/widget/home_tab.dart';
import 'package:todo_app/feature/profile/ui/profile_screen.dart';
import 'package:todo_app/feature/task/ui/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeTab(),
    CalendarScreen(),
    TasksScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
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
