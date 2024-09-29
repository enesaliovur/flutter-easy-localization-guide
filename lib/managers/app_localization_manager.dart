import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:how_to_use_easy_localization/constants/app_assets_path.dart';
import 'package:how_to_use_easy_localization/constants/enums/app_locale.dart';

class AppLocalizationManager {
  // 1. Singleton instance
  static final AppLocalizationManager _instance =
      AppLocalizationManager._internal();

  // 2. Private constructor to prevent external instantiation
  AppLocalizationManager._internal();

  // 3. Factory constructor returns the same instance every time
  factory AppLocalizationManager() => _instance;

  // 4. Supported locales
  static final List<Locale> supportedLocales = [
    AppLocale.en.locale,
    AppLocale.tr.locale,
  ];

  // 5. Path to translation files
  static const String translationPath = translationsPath;

  // 6. Init method
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  // 7. Method to change the locale
  static Future<void> changeLocale(
    BuildContext context, {
    required AppLocale appLocale,
  }) async {
    try {
      await context.setLocale(appLocale.locale);
    } catch (e) {
      debugPrint('change locale returns error: $e');
    }
  }
}
