
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class WeekDatesList extends StatelessWidget {
  final int selectedDateIndex;
  final ValueChanged<int> onDateSelected;

  const WeekDatesList({
    super.key,
    required this.selectedDateIndex,
    required this.onDateSelected,
  });

  List<DateTime> get weekDates {
    final today = DateTime.now();

    return List.generate(5, (index) {
      return today.subtract(
        Duration(days: today.weekday - 1 - index),
      );
    });
  }

  String monthName(int month) {
    const months = [
      'jan', 'feb', 'mar', 'apr',
      'may', 'jun', 'jul', 'aug',
      'sep', 'oct', 'nov', 'dec',
    ];

    return months[month - 1].tr();
  }

  String dayName(int day) {
    const days = [
      'mon', 'tue', 'wed', 'thu',
      'fri', 'sat', 'sun',
    ];

    return days[day - 1].tr();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: weekDates.length,
        itemBuilder: (context, index) {
          final date = weekDates[index];
          final isSelected = selectedDateIndex == index;

          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 55,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff713FF2)
                    : Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xffE5DEFF),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    monthName(date.month),
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Colors.white70
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xff25213C),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    dayName(date.weekday),
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
