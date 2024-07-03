import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'locales/locale_en.dart';
import 'locales/locale_zh.dart';

class TranslationLibrary extends Translations {
  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('zh', 'CN');

  static const supportedLocales = [
    Locale('zh', 'CN'),
    Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh': zh,
        'en': en,
      };

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
