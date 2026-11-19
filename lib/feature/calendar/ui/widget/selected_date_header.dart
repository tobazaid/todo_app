
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectedDateHeader extends StatelessWidget {
  final DateTime selectedDay;

  const SelectedDateHeader({
    super.key,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'tasks'.tr(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),

          Text(
            "${selectedDay.day}/${selectedDay.month}/${selectedDay.year}",
            style: TextStyle(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
