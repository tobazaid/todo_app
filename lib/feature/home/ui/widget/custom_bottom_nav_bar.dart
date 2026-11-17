import 'package:flutter/material.dart';
import 'package:todo_app/feature/profile/ui/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() =>
      _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  final Color purpleColor = const Color(0xFF6D3EF0);

  final List<Widget> screens = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Calendar Screen")),
    const Center(child: Text("Tasks Screen")),
    const ProfileScreen(),
  ];

  Widget navItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
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
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: SafeArea(
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
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      navItem(Icons.home_outlined, "Home", 0),
                      navItem(Icons.calendar_month_outlined, "Calendar", 1),
                      const SizedBox(width: 65),
                      navItem(Icons.article_outlined, "Tasks", 2),
                      navItem(Icons.person_outline, "Profile", 3),
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
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}