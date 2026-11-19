
import 'package:flutter/material.dart';

ValueNotifier<ThemeMode> appThemeMode =
    ValueNotifier(ThemeMode.light);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  scaffoldBackgroundColor: const Color(0xffF7F5FF),

  cardColor: Colors.white,

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffF7F5FF),
    foregroundColor: Color(0xff25213C),
    elevation: 0,
    centerTitle: true,
  ),

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff713FF2),
    brightness: Brightness.light,
    surface: Colors.white,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xff25213C)),
    bodyMedium: TextStyle(color: Color(0xff25213C)),
    titleLarge: TextStyle(color: Color(0xff25213C)),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  scaffoldBackgroundColor: const Color(0xff121212),

  cardColor: const Color(0xff1E1E1E),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff121212),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff9B7BFF),
    brightness: Brightness.dark,
    surface: const Color(0xff1E1E1E),
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xff252525),
    hintStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
);
