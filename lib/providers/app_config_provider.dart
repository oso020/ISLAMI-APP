import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String locale;
  bool mode;
  ThemeMode theme;

  AppConfigProvider({this.locale = "en", this.mode = true})
      : theme = mode ? ThemeMode.dark : ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (locale == newLanguage) {
      return;
    }
    locale = newLanguage;
    notifyListeners();
    saveDataLocalization();
  }

  void saveDataLocalization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appLanguage', locale);
    notifyListeners();
  }

  void saveDataTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', mode);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (theme == newTheme) {
      return;
    }
    theme = newTheme;
    mode = newTheme == ThemeMode.dark;
    notifyListeners();
    saveDataTheme();
  }
}
