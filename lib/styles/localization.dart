import 'package:easy_localization/easy_localization.dart';

import '../common_libs.dart';

class Localization {
  static const String path = "assets/translations";

  //Attention! First Locale will be always the fallBackLocale so put English at first always.
  static const List<Locale> _supportedLocales = [
    Locale("en"),
    Locale("tr"),
  ];

  static EasyLocalization easyLocalization(Widget app) {
    return EasyLocalization(
      supportedLocales: _supportedLocales,
      path: path,
      fallbackLocale: _supportedLocales.first,
      useOnlyLangCode: true,
      child: app,
    );
  }
}
