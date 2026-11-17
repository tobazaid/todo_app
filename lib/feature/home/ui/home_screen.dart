import 'package:flutter/material.dart';
import 'package:todo_app/feature/home/ui/widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

      ],),
       bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
