
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TaskFilterList extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const TaskFilterList({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final List<String> filters = const [
    'All',
    'To do',
    'In Progress',
    'Done',
  ];

  String getTranslation(String filter) {
    switch (filter) {
      case 'All':
        return 'all'.tr();
      case 'To do':
        return 'to_do'.tr();
      case 'In Progress':
        return 'in_progress'.tr();
      case 'Done':
        return 'done'.tr();
      default:
        return filter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () => onFilterChanged(filter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff713FF2)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                getTranslation(filter),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xff25213C),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
