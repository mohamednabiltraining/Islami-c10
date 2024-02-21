import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String selectedLocale = "en";
  ThemeMode selectedTheme = ThemeMode.light;

  SettingsProvider() {
    //Todo:read theme,locale from SharedPreferences
  }

  void changeLanguage(String newLocale) {
    selectedLocale = newLocale;
    //Todo:set lang in shared preferences
    notifyListeners();
  }

  String getSelectedLocaleName() {
    return selectedLocale == "en" ? "English" : "العربيه";
  }

  void changeTheme(ThemeMode newTheme) {
    selectedTheme = newTheme;
    //Todo:set theme in shared preferences
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
