import 'package:example/common/langs/index.dart';
import 'package:example/pages/home/index.dart';
import 'package:example/common/styles/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

void main() async {
  WidgetsBinding widgetsBinding = await init(
    isDebug: kDebugMode,
    logTag: 'Example',
    supportedLocales: TranslationLibrary.supportedLocales,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    GetxApp(
      // 设计稿尺寸 单位：dp
      designSize: const Size(390, 844),
      // Getx Log
      enableLog: kDebugMode,
      // 默认的跳转动画
      defaultTransition: Transition.rightToLeft,
      // 主题模式
      themeMode: GlobalService.to.themeMode,
      // 主题
      theme: AppTheme.light,
      // Dark主题
      darkTheme: AppTheme.dark,
      // AppTitle
      title: 'Example',
      //国际化配置
      locale: GlobalService.to.locale,
      translations: TranslationLibrary(),
      fallbackLocale: TranslationLibrary.fallbackLocale,
      supportedLocales: TranslationLibrary.supportedLocales,
      localizationsDelegates: TranslationLibrary.localizationsDelegates,
      // 首页
      home: const HomePage(),
    ),
  );
}
