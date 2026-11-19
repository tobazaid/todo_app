
import 'package:flutter/material.dart';
import 'package:todo_app/feature/home/ui/widget/home_header.dart';
import 'package:todo_app/feature/home/ui/widget/home_banner.dart';
import 'package:todo_app/feature/home/ui/widget/home_tasks_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeHeader(),
            SizedBox(height: 20),
            HomeBanner(),
            SizedBox(height: 24),
            Expanded(
              child: HomeTasksList(),
            ),
          ],
        ),
      ),
    );
  }
}
