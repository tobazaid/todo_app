import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart'; // عشان تستخدم الـ main color بتاعك
import 'package:todo_app/core/app_text_style.dart'; // لو هتستخدم الستايلات بتاعتك

class CustomGroupDropdown extends StatefulWidget {
  const CustomGroupDropdown({super.key});

  @override
  State<CustomGroupDropdown> createState() => _CustomGroupDropdownState();
}

class _CustomGroupDropdownState extends State<CustomGroupDropdown> {
  // القيمة المختارة حالياً
  String selectedGroup = "Work";
  
  // اللستة اللي فيها الاختيارات
  final List<String> groups = ["Work", "Personal", "Study", "Shopping"];

  @override
  Widget build(BuildContext context) {
    return Container(
      // الشكل الخارجي (أبيض، حواف دائرية، وظل خفيف جداً)
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), // ظل خفيف جداً
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline( // عشان نخفي الخط اللي تحت الـ Dropdown الافتراضي
        child: DropdownButton<String>(
          value: selectedGroup,
          isExpanded: true, // عشان ياخد عرض الشاشة كلها
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey), // السهم
          
          // شكل العناصر جوه اللستة المنسدلة
          items: groups.map((String group) {
            return DropdownMenuItem<String>(
              value: group,
              child: Text(
                group,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            );
          }).toList(),
          
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedGroup = newValue;
              });
            }
          },
          
          // الشكل اللي بيظهر فوق (اللي في صورتك)
          selectedItemBuilder: (BuildContext context) {
            return groups.map((String group) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Select Group",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey, // لون رمادي للعنوان الصغير
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    group,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}