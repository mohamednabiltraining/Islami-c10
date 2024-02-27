import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider extends ChangeNotifier {
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String selectedLocale = "en";
  ThemeMode selectedTheme = ThemeMode.light;
  SettingsProvider() {
    //Todo:read theme,locale from SharedPreferences
  }

  Future<void> changeLanguage(String newLocale) async {
    selectedLocale = newLocale;
    //Todo:set lang in shared preferences
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('lang', selectedLocale);
    notifyListeners();
  }


  String getSelectedLocaleName() {
    return selectedLocale == "en" ? "English" : "العربيه";
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    selectedTheme = newTheme;
    //Todo:set theme in shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('mode', selectedTheme.name);
    
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
 Future<void>loadSetting() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String? mode=prefs.getString('mode');
   String? lang=prefs.getString('lang');
   mode ??= 'light';
   selectedTheme=(mode=='dark'?ThemeMode.dark:ThemeMode.light);
   lang??='en';
   selectedLocale=lang;
 }

}
