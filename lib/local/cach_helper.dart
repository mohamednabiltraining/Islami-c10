
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setLanguage(String value){
      return sharedPreferences!.setString('local', value);
  }

  static Future<bool> setTheme(ThemeMode mode){
    String value = '';
    if(mode == ThemeMode.light){
      value = 'light';
    }
    else{
      value = 'dark';
    }
      return sharedPreferences!.setString('theme', value);
  }

  static String getLanguage(){

    return sharedPreferences!.getString('local') ?? 'en';
  }

  static String getTheme(){

    return sharedPreferences!.getString('theme') ?? 'light';
  }

}