import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  final String themeModeValueKey = 'themeMode';
  String themeDropDownValue = 'light';

  // becouse i use easy locale packge i cant set saved locale at start
  // so i aready get themeMode at start so i will also do it here with it
  // if you eng john have solotion to set (theme drop botton) in the start
  // please send feedback

  final SharedPreferences prefs;

  ThemeProvider({required this.prefs}) {
    readSavedThemeMode();
  }

  bool isDarkThemeMode() {
    return currentThemeMode == ThemeMode.dark;
  }

  void readSavedThemeMode() {
    bool isDark = prefs.getBool(themeModeValueKey) ?? false;
    currentThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    themeDropDownValue = isDark ? 'dark' : 'light';
  }

  void saveThemeMode() {
    prefs.setBool(themeModeValueKey, isDarkThemeMode());
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    currentThemeMode = newThemeMode;
    notifyListeners();
    saveThemeMode();
  }

  void onThemeDropDownClick(String? newTheme) {
    if (newTheme is String) {
      themeDropDownValue = newTheme;
      notifyListeners();
    }
  }

  static ThemeProvider get(BuildContext context) {
    return Provider.of<ThemeProvider>(context);
  }
}