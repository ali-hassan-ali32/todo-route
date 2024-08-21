import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;



  void changeThemeMode(ThemeMode newThemeMode) {
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  bool isDarkThemeMode() {
    return currentThemeMode == ThemeMode.dark;
  }

  static ThemeProvider get(BuildContext context) {
    return Provider.of<ThemeProvider>(context);
  }
}