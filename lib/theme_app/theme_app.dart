import 'package:flutter/material.dart';
import 'package:islami_app/theme_app/color_app.dart';

class ThemeApp {
  static final ThemeData lightMode = ThemeData(
    primaryColor: ColorApp.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: ColorApp.blackColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: ColorApp.blackColor),
    ),
    dividerTheme: DividerThemeData(thickness: 3, color: ColorApp.primaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorApp.blackColor,
    ),
  );
}
