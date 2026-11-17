import 'package:flutter/material.dart';

class AppButtonStyle {
  static final ButtonStyle nextButton = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF6D3EF0),
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 60),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}