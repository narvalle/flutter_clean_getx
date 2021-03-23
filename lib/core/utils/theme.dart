import 'package:flutter/material.dart';

final Color _fontBlack = Color(0xFF000000);
final Color _fontBlackBody = Color(0xFF33363B);
final Color _white = Color(0xFFFFFFFF);
final Color _accentColor = Color(0xFF4895EF);
final Color _primaryColor = Color(0xFFF72585);
final Color _primaryColorDark = Color(0xFF560BAD);
final Color _primaryColorLight = Color(0xFF7209B7);
final mainTheme = ThemeData(
  brightness: Brightness.light,
  accentColor: _accentColor,
  primaryColor: _primaryColor,
  primaryColorDark: _primaryColorDark,
  primaryColorLight: _primaryColorLight,
  scaffoldBackgroundColor: _white,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: _fontBlack,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: _primaryColorDark,
    ),
    bodyText1: TextStyle(fontSize: 15, color: _fontBlackBody),
  ),
);
