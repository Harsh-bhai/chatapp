import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  primaryColor: Colors.green.shade500,
  primaryColorDark: Colors.grey.shade600,
  primaryColorLight: Colors.grey.shade800,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.green.shade500,
  ),
  iconTheme: IconThemeData(color: Colors.green.shade500),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
  primaryColor: Colors.green.shade800,
  primaryColorDark: Colors.grey.shade800,
  primaryColorLight: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Colors.green.shade800,
  ),
  iconTheme: IconThemeData(color: Colors.green.shade500),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
