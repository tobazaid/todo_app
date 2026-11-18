import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/addproject/ui/add_project.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onTabChanged;
  const CustomBottomNavBar({super.key, required this.onTabChanged});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  final Color purpleColor = const Color(0xFF6D3EF0);

  Widget navItem(IconData icon, String title, int index) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => selectedIndex = index);
          widget.onTabChanged(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? purpleColor : Colors.blueGrey,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? purpleColor : Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 76,
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    navItem(Icons.home_outlined,
                        "home".tr(context: context), 0),
                    navItem(Icons.calendar_month_outlined,
                        "calendar".tr(context: context), 1),
                    const SizedBox(width: 65),
                    navItem(Icons.article_outlined,
                        "tasks".tr(context: context), 2),
                    navItem(Icons.person_outline,
                        "profile".tr(context: context), 3),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: purpleColor,
                    border: Border.all(color: surface, width: 3),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProject(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}