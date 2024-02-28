import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String selectedLocale = "en";
  ThemeMode selectedTheme = ThemeMode.light;

  void LoadSettingsData() async {
    //Todo:read theme,locale from SharedPreferences

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? Mode = sharedPreferences.getString('ThemeMode');
    String? language = sharedPreferences.getString('Language');

    Mode ?? "light";
    selectedTheme = (Mode == "dark" ? ThemeMode.dark : ThemeMode.light);

    language ??= 'en';
    selectedLocale = language;
  }

  Future<void> changeLanguage(String newLocale) async {
    selectedLocale = newLocale;
    //Todo:set lang in shared preferences
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('Language', selectedLocale);
    notifyListeners();
  }

  String getSelectedLocaleName() {
    return selectedLocale == "en" ? "English" : "العربيه";
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    selectedTheme = newTheme;
    //Todo:set theme in shared preferences
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('ThemeMode', selectedTheme.name);
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
