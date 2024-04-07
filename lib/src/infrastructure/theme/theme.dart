import 'package:flutter/material.dart';
import 'package:my_netflix_api_admin_web/src/infrastructure/theme/theme_colors.dart';

ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF2697FF), secondary: const Color(0xFF2A2D3E)));

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark().copyWith(error: errorColor));
