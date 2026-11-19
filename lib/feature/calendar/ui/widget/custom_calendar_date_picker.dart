
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarDatePicker extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime) onPageChanged;

  const CustomCalendarDatePicker({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onPageChanged,
  });

  bool isSameDate(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(22),
      ),

      child: TableCalendar(
        firstDay: DateTime(2020),
        lastDay: DateTime(2035),
        focusedDay: focusedDay,

        selectedDayPredicate: (day) {
          return isSameDate(day, selectedDay);
        },

        onDaySelected: onDaySelected,
        onPageChanged: onPageChanged,

        calendarFormat: CalendarFormat.month,

        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: colors.primary,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: colors.primary,
          ),
        ),

        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: TextStyle(
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),

        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,

          defaultTextStyle: TextStyle(
            color: colors.onSurface,
          ),

          weekendTextStyle: TextStyle(
            color: colors.onSurface,
          ),

          todayDecoration: BoxDecoration(
            color: colors.primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),

          todayTextStyle: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.bold,
          ),

          selectedDecoration: BoxDecoration(
            color: colors.primary,
            shape: BoxShape.circle,
          ),

          selectedTextStyle: TextStyle(
            color: colors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
