
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const CalendarHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      foregroundColor: colors.onSurface,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'calendar'.tr(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
