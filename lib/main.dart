import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:how_to_use_easy_localization/constants/enums/app_locale.dart';
import 'package:how_to_use_easy_localization/generated/locale_keys.g.dart';
import 'package:how_to_use_easy_localization/managers/app_localization_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalizationManager.init();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizationManager.supportedLocales,
      path: AppLocalizationManager.translationPath,
      useOnlyLangCode: true,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(LocaleKeys.home).tr(),
              const SizedBox(height: 120),
              ElevatedButton(
                onPressed: () {
                  debugPrint('English button pressed');
                  AppLocalizationManager.changeLocale(
                    context,
                    appLocale: AppLocale.en,
                  );
                },
                child: const Text(LocaleKeys.buttons_english).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Turkish button pressed');
                  AppLocalizationManager.changeLocale(
                    context,
                    appLocale: AppLocale.tr,
                  );
                },
                child: const Text(LocaleKeys.buttons_turkish).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Save button pressed');
                },
                child: const Text(LocaleKeys.buttons_save).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Delete button pressed');
                },
                child: const Text(LocaleKeys.buttons_delete).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Cancel button pressed');
                },
                child: const Text(LocaleKeys.buttons_cancel).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
