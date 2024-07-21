import 'package:flutter/material.dart';
import 'package:islami_app/theme_app/color_app.dart';

class ThemeApp {
  static final ThemeData lightMode = ThemeData(
      primaryColor: ColorApp.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
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
      dividerTheme: const DividerThemeData(
          thickness: 3, color: ColorApp.primaryLightColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorApp.primaryLightColor,
        selectedItemColor: ColorApp.blackColor,
    ),
      iconTheme: IconThemeData(
        color: ColorApp.primaryLightColor,
      ));

  static final ThemeData darktMode = ThemeData(
      primaryColor: ColorApp.primaryDarkColorBlue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          foregroundColor: ColorApp.whiteColor,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ColorApp.whiteColor),
        bodyMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: ColorApp.primaryDarkColor),
      ),
      dividerTheme: const DividerThemeData(
          thickness: 3, color: ColorApp.primaryDarkColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorApp.primaryDarkColor,
          selectedItemColor: ColorApp.primaryDarkColor,
          unselectedItemColor: ColorApp.whiteColor),
      iconTheme: IconThemeData(
        color: ColorApp.primaryDarkColor,
      ));
}
