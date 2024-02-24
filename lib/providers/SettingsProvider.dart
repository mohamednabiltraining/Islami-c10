import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String selectedLocale = "en";
  ThemeMode selectedTheme = ThemeMode.light;

  SettingsProvider() {
    //Todo:read theme,locale from SharedPreferences
    getLanguageSharedPreferences();
    getThemeSharedPreferences();
  }

  void changeLanguage(String newLocale) {
    selectedLocale = newLocale;
    //Todo:set lang in shared preferences
    saveLanguageSharedPreferences('lang', selectedLocale);
    notifyListeners();
  }

  saveLanguageSharedPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  getLanguageSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLocale = prefs.getString('lang') ?? "en";
    notifyListeners();
  }

  saveThemeSharedPreferences(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  getThemeSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('theme');
    if (prefs.getInt('theme') == 1) {
      selectedTheme = ThemeMode.light;
    } else {
      selectedTheme = ThemeMode.dark;
    }
    notifyListeners();
  }

  String getSelectedLocaleName() {
    return selectedLocale == "en" ? "English" : "العربيه";
  }

  void changeTheme(ThemeMode newTheme) {
    selectedTheme = newTheme;
    //Todo:set theme in shared preferences
    saveThemeSharedPreferences('theme', selectedTheme.index);
    notifyListeners();
  }

  bool isDarkModeEnabled() {
    return selectedTheme == ThemeMode.dark;
  }

  String getMainBackgroundImage() {
    return isDarkModeEnabled()
        ? "assets/images/main_background_dark.png"
        : "assets/images/main_background.jpg";
  }

  String getSplashBackground() {
    return isDarkModeEnabled()
        ? "assets/images/splash_dark.jpg"
        : "assets/images/splash.jpg";
  }
}
