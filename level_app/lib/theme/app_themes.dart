import 'package:flutter/material.dart';

//Color ARGB(255, 21, 87, 31)
//Color 2 ARGB (255, 17, 68, 24)

enum AppTheme {
  GreenLight,
  GreenDark,
}

final appThemeData = {
  AppTheme.GreenLight: ThemeData(
      primaryColor: const Color.fromARGB(255, 21, 87, 31),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 21, 87, 31),
        brightness: Brightness.light,
      ),
      dividerColor: const Color.fromARGB(255, 21, 87, 31),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 63, 63, 63)),
      )
    ),
  AppTheme.GreenDark: ThemeData(
    primaryColor: const Color.fromARGB(255, 17, 68, 24),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 17, 68, 24)!,
      brightness: Brightness.dark,
    ),
    dividerColor: Colors.green,
    textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 163, 163, 163)),
      )
  ),
};
