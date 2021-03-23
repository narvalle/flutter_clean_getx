import 'package:flutter/material.dart';

final Color _fontBlack = Color(0xFF000000);
final Color _white = Color(0xFFFFFFFF);
final mainTheme = ThemeData(
  brightness: Brightness.light,
  accentColor: const Color(0xFF4895EF),
  primaryColor: const Color(0xFFF72585),
  primaryColorDark: const Color(0xFF560BAD),
  primaryColorLight: const Color(0xFF7209B7),
  scaffoldBackgroundColor: _white,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: _fontBlack,
    ),
  ),
);
