import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * Created by Abdullah on 9/4/25.
 */

class LanguageManager {
  static final ValueNotifier<Locale> currentLocale = ValueNotifier(const Locale('en'));

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('bn'),
  ];

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language') ?? 'en';
    currentLocale.value = Locale(savedLang);
  }

  static Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    currentLocale.value = Locale(languageCode);
  }
}