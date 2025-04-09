import 'package:flutter/material.dart';

import '../localization/language_manager.dart';

/**
 * Created by Abdullah on 9/4/25.
 */

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LanguageManager.currentLocale,
      builder: (context, currentLocale, child) {
        return DropdownButton<Locale>(
          value: currentLocale,
          icon: const Icon(Icons.language),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              LanguageManager.changeLanguage(newLocale.languageCode);
            }
          },
          items: LanguageManager.supportedLocales.map((locale) {
            return DropdownMenuItem<Locale>(
              value: locale,
              child: Text(_getLanguageName(locale.languageCode)),
            );
          }).toList(),
        );
      },
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'bn':
        return 'Bangla';
      default:
        return 'Unknown';
    }
  }
}