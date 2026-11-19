
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TaskDescription extends StatelessWidget {
  final String description;

  const TaskDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'description'.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
