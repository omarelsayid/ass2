import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  ThemeData themeData = ThemeData.light();

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeData =
        prefs.getBool('isDark') ?? false ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  bool get isDarkMode => themeData.brightness == Brightness.dark;

  Future<void> changeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeData = isDarkMode ? ThemeData.light() : ThemeData.dark();
    await prefs.setBool('isDark', isDarkMode ? true : false);
    notifyListeners();
  }
}