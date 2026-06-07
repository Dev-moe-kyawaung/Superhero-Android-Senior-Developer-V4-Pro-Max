import 'dart:ui';
import 'package:flutter/material.dart';

class AppTheme {
  static const background = Color(0xFF040711);
  static const surface = Color(0xFF11192D);
  static const primary = Color(0xFFB08CFF);
  static const secondary = Color(0xFF31D0AA);
  static const accent = Color(0xFFFFC857);

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      cardTheme: CardTheme(
        color: surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}
