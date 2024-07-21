import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String locale;

  AppConfigProvider({this.locale = "en"});

  ThemeMode theme = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    if (locale == newLanguage) {
      return;
    }
    locale = newLanguage;
    notifyListeners();
    saveData();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appLanguage', locale);
    notifyListeners();
  }

  void changTheme(ThemeMode newTheme) {
    if (theme == newTheme) {
      return;
    }
    theme = newTheme;
    notifyListeners();
  }
}
