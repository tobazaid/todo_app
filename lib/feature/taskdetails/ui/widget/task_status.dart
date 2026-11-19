
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TaskStatus extends StatelessWidget {
  final bool isCompleted;

  const TaskStatus({
    super.key,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'status'.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: isCompleted
                ? (theme.brightness == Brightness.dark
                    ? Colors.green.withOpacity(0.2)
                    : const Color(0xffDDF7E8))
                : colors.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            isCompleted ? 'done'.tr() : 'to_do'.tr(),
            style: TextStyle(
              color: isCompleted ? Colors.green : colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
