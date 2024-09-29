import 'dart:ui';

enum AppLocale {
  en(Locale('en', 'US')),
  tr(Locale('tr', 'TR'));

  final Locale locale;
  const AppLocale(this.locale);
}
