import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-29
 * @description: 
 */

/// 语言改变的回调
typedef LocaleChangeCallback = Function(Locale locale);

/// 全局服务
class GlobalService extends GetxService with WidgetsBindingObserver {
  static GlobalService get to => Get.find();
  late EventBus eventBus;
  late SharedPreferences sharedPreferences;
  PackageInfo? _packageInfo;
  BaseDeviceInfo? _baseDeviceInfo;

  static const String themeCodeKey = 'themeCodeKey';
  static const String languageCodeKey = 'languageCodeKey';

  //主题
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  //语言
  Locale locale = PlatformDispatcher.instance.locale;
  LocaleChangeCallback? localeChangeCallback;

  Future<GlobalService> init({
    List<Locale>? supportedLocales,
    LocaleChangeCallback? localeChangeCallback,
  }) async {
    WidgetsBinding.instance.addObserver(this);
    eventBus = EventBus();
    sharedPreferences = await SharedPreferences.getInstance();
    this.localeChangeCallback = localeChangeCallback;
    //初始化本地语言配置
    _initLocale(supportedLocales);
    //初始化主题配置
    _initTheme();
    return this;
  }

  /// 设置语言变更回调
  void setLocaleChangeCallback(LocaleChangeCallback? localeChangeCallback) {
    this.localeChangeCallback = localeChangeCallback;
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// 系统当前是否是暗黑模式
  bool isDarkModel(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  /// 初始 theme
  void _initTheme() {
    var themeCode = sharedPreferences.getString(themeCodeKey) ?? 'system';
    switch (themeCode) {
      case 'system':
        _themeMode = ThemeMode.system;
        break;
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
    }
  }

  /// 更改主题
  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    Get.changeThemeMode(_themeMode);
    if (_themeMode == ThemeMode.system) {
      await setValue(themeCodeKey, 'system');
    } else {
      await setValue(
          themeCodeKey, themeMode == ThemeMode.dark ? 'dark' : 'light');
    }
    updateNavigationBar();
    refreshAppui();
  }

  updateNavigationBar([BuildContext? context]) {
    if (Platform.isAndroid) {
      bool isDarkMode = isDarkModel(context ?? Get.context!);
      if (_themeMode != ThemeMode.system) {
        isDarkMode = _themeMode == ThemeMode.dark;
      }
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: isDarkMode ? Colors.black87 : Colors.white,
          systemNavigationBarIconBrightness: isDarkMode
              ? Brightness.light // Light icons on dark background
              : Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isDarkMode ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
          systemStatusBarContrastEnforced: isDarkMode,
        ),
      );
    }
  }

  /// 监听平台切换了主题模式
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (_themeMode == ThemeMode.system) {
      refreshAppui();
    }
  }

  /// 监听应用生命周期并发送给全部页面
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    sendEvent(LifecycleEvent(state));
  }

  // 初始化本地语言配置
  void _initLocale(List<Locale>? supportedLocales) {
    if (supportedLocales == null) {
      return;
    }
    var langCode = sharedPreferences.getString(languageCodeKey) ?? '';
    if (langCode.isEmpty) {
      return;
    }
    var index = supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) {
      return;
    }
    locale = supportedLocales[index];
    localeChangeCallback?.call(locale);
  }

  // 更改语言
  Future<void> changeLocale(Locale value) async {
    locale = value;
    localeChangeCallback?.call(locale);
    await setValue(languageCodeKey, value.languageCode);
    Get.updateLocale(value);
    refreshAppui();
  }

  // 获取包信息
  Future<PackageInfo> getPackageInfo() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
    return _packageInfo!;
  }

  // 获设备信息
  Future<BaseDeviceInfo> getDeviceInfo() async {
    _baseDeviceInfo ??= await DeviceInfoPlugin().deviceInfo;
    return _baseDeviceInfo!;
  }
}
