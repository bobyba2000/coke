import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleUtility {
  static final ValueNotifier<Locale> locale = ValueNotifier(const Locale('en'));

  static Future<void> saveLocale(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', languageCode);
  }

  static Future<String> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('locale') ?? 'en';
  }
}
