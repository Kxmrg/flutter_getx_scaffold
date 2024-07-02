import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
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

/// 全局服务
class GlobalService extends GetxService with WidgetsBindingObserver {
  static GlobalService get to => Get.find();
  late EventBus eventBus;
  late SharedPreferences sharedPreferences;

  static const String themeCodeKey = 'themeCodeKey';

  //主题
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<GlobalService> init() async {
    WidgetsBinding.instance.addObserver(this);
    eventBus = EventBus();
    sharedPreferences = await SharedPreferences.getInstance();
    //初始化主题配置
    _initTheme();
    return this;
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
    refreshAppui();
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
}
