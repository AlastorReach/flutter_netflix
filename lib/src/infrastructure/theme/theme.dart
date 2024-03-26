import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF2697FF), secondary: const Color(0xFF2A2D3E)));

ThemeData darkTheme = ThemeData.dark();
