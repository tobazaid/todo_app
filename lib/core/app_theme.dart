
import 'package:flutter/material.dart';

ValueNotifier<ThemeMode> appThemeMode =
    ValueNotifier(ThemeMode.light);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff5D9CEC),
    brightness: Brightness.light,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff121212),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff5D9CEC),
    brightness: Brightness.dark,
  ),
);
