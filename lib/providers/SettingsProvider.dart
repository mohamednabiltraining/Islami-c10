import 'package:flutter/material.dart';
import 'package:islami_c10/local/cach_helper.dart';

class SettingsProvider extends ChangeNotifier {
  String selectedLocale = "en";
  ThemeMode selectedTheme = ThemeMode.light;

  SettingsProvider() {
    //Todo:read theme,locale from SharedPreferences
    selectedLocale = CashHelper.getLanguage();

    if(CashHelper.getTheme() == 'light'){
      selectedTheme = ThemeMode.light;
    }
    else{
      selectedTheme = ThemeMode.dark;
    }
  }

  void changeLanguage(String newLocale) {
    //Todo:set lang in shared preferences
    selectedLocale = newLocale;
    CashHelper.setLanguage(newLocale);
    notifyListeners();
  }

  String getSelectedLocaleName() {
    return selectedLocale == "en" ? "English" : "العربيه";
  }

  void changeTheme(ThemeMode newTheme) {
    //Todo:set theme in shared preferences
    selectedTheme = newTheme;
    CashHelper.setTheme(newTheme);
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
