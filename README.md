<h1 align="center"> GetX Scaffold</h1>

<div align="center">

基于 GetX 的快速开发脚手架

![Flutter](https://img.shields.io/badge/Flutter-3.19.5-blue?logo=Flutter)
![Get](https://img.shields.io/badge/Get-4.6.6-orange)
![Dio](https://img.shields.io/badge/Dio-5.4.3+1-green)

</div>

<div align="center">

简体中文 | [English](./README.en-US.md)

</div>

## 关于 GetX Scaffold

GetXScaffold 快速开发脚手架在 GetX 框架和一些常用插件的基础上，构建了一套完整的快速开发模板。其中包括新增了部分常用功能的全局方法、常用的扩展方法和各种工具类、部分常用组件的封装、简单易用的对话框、二次封装的 Dio 网络请求工具、二次封装的 GetxController、二次封装的应用主题和国际化实现等。GetXScaffold 是对以上这些内容的过度封装，包括一些组件的扩展方法会违背 Flutter 本身的开发规范，改变你的开发习惯。所以本脚手架单纯为了提高开发效率，减少重复代码，减少开发成本。如果您是刚接触 Flutter 开发并还处在学习过程中的话，并不推荐您使用该脚手架。以下只是部分功能的使用示例，建议您通过示例项目或者源码了解全部使用方法。

## 运行示例项目

```
cd example
flutter pub get
flutter run
```

## 快速开始

#### 1. 添加依赖

Flutter 工程中 pubspec.yaml 文件里加入以下依赖：

```dart
dependencies:
  getx_scaffold: 0.0.1

  # 如果您的项目中需要使用国际化，请添加以下依赖
  flutter_localizations:
    sdk: flutter
```

#### 2. 初始化脚手架

在 main.dart 中初始化 GetXScaffold：

```dart
import 'package:getx_scaffold/getx_scaffold.dart';

void main() async {
  WidgetsBinding widgetsBinding = await init(
    isDebug: kDebugMode,
    logTag: 'GetxScaffold',
    supportedLocales: TranslationLibrary.supportedLocales,
  );
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
      // 国际化配置
      locale: GlobalService.to.locale,
      translations: TranslationLibrary(),
      fallbackLocale: TranslationLibrary.fallbackLocale,
      supportedLocales: TranslationLibrary.supportedLocales,
      localizationsDelegates: TranslationLibrary.localizationsDelegates,
      // AppTitle
      title: 'GetxScaffold',
      // 首页
      home: const HomePage(),
    ),
  );
}
```

GetxApp 是 GetMaterialApp 嵌套了 ScreenUtilInit 对全局进行屏幕适配，通过 GlobalService 可以方便的实现多主题和多语言的切换。

#### 3. 定义主题

```dart
import 'package:flutter/material.dart';

class AppTheme {
  static const String fontMontserrat = 'Montserrat';

  static const Color themeColor = Color.fromARGB(255, 11, 107, 47);

  static const Color darkThemeColor = Color.fromARGB(255, 27, 31, 139);

  /// 亮色主题样式
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: themeColor,
      brightness: Brightness.light,
    ),
    fontFamily: fontMontserrat,
    cardTheme: CardTheme(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  /// 暗色主题样式
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkThemeColor,
      brightness: Brightness.dark,
    ),
    fontFamily: fontMontserrat,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
```

以上是主题示例，GetXScaffold 的所有内置组件均遵循 Material3 设计规范。如果你使用 colorScheme 定义了主题颜色，那么你可以通过以下方法使用所有的主题颜色：

```dart
ThemeColor.onPrimary
ThemeColor.onSecondary
ThemeColor.onSurface
......
```

#### 4. 国际化

GetXScaffold 再次简化的国际化实现，您需要创建 TranslationLibrary 并实现以下方法：

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'locales/locale_en.dart';
import 'locales/locale_es.dart';
import 'locales/locale_zh.dart';

class TranslationLibrary extends Translations {
  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('zh', 'CN');

  static const supportedLocales = [
    Locale('zh', 'CN'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh': zh,
        'en': en,
        'es': es,
      };

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
```

在 main.dart GetxApp 中加入以下代码：

```dart
// 国际化配置
locale: GlobalService.to.locale,
translations: TranslationLibrary(),
fallbackLocale: TranslationLibrary.fallbackLocale,
supportedLocales: TranslationLibrary.supportedLocales,
localizationsDelegates: TranslationLibrary.localizationsDelegates,
```

#### 5. 添加页面

GetXScaffold 的所有页面使用 GetView 加 GetxController 试图与逻辑分离的开发方式。这里注意，所有 GetxController 必须混入 BaseControllerMixin，以相应全局刷新。

##### HomePage.dart

```dart
import 'package:flutter/material.dart';
import 'package:example/common/langs/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: Text(TextKey.zhuTi.tr),
        onTap: () {
          Get.to(() => const ThemePage());
        },
      ),
      ListTile(
        title: Text(TextKey.yuYan.tr),
        onTap: () {
          Get.to(() => const LanguagePage());
        },
      ),
    ]
        .toListView(
          separator: const DividerX(),
        )
        .scrollbar()
        .safeArea();
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.info),
    ).padding(all: 20.w);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      //这里的id需要与HomeController中的builderId一致
      id: 'home',
      builder: (_) {
        //双击退出
        return DoublePressBackWidget(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("GetxScaffold"),
              centerTitle: true,
              elevation: 1,
            ),
            floatingActionButton: _buildFloatingActionButton(),
            body: _buildView(),
          ),
        );
      },
    );
  }
}

```

##### HomeController.dart

```dart
import 'package:getx_scaffold/getx_scaffold.dart';

class HomeController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'home';

  HomeController();

  @override
  void onInit() {
    super.onInit();

    //刷新ui
    updateUi();
    //返回
    back();
    //延时退出
    delayedBack();
  }

  /// 是否监听生命周期事件
  @override
  bool get listenLifecycleEvent => true;

  /// listenLifecycleEvent设置为true时，会调用以下生命周期方法
  @override
  void onDetached() {
    log('onDetached');
  }

  @override
  void onHidden() {
    log('onHidden');
  }

  @override
  void onInactive() {
    log('onInactive');
  }

  @override
  void onPaused() {
    log('onPaused');
  }

  @override
  void onResumed() {
    log('onResumed');
  }
}

```

## 全局方法

```dart
/// 获取当前时间戳(Millisecond)
int getTimeStamp({bool isSecond = false})

/// 获取当前时间戳(Second)
int getTimeStampSecond()

/// 获取当前日期字符串
String getNowDateString()

/// 获取当前日期时间字符串
String getNowDateTimeString()

/// 获取当前时间字符串
String getNowTimeString()

/// 判断设备是否连接网络
Future<bool> isNetworkAvailable()

/// 判断设备是否连接移动网络
Future<bool> isConnectedToMobile()

/// 判断设备是否连接WiFi
Future<bool> isConnectedToWiFi()

/// 显示Toast
void showToast(String msg)

/// 显示成功Toast
void showSuccessToast(String msg)

/// 显示提示Toast
void showInfoToast(String msg)

/// 显示警告Toast
void showWarningToast(String msg)

/// 显示错误Toast
void showErrorToast(String msg)

/// 显示loading
void showLoading([String? msg])

/// 显示错误
void showError([String? msg])

/// 显示提示
void showInfo(String msg)

/// 隐藏loading
void dismissLoading()

/// 延时执行
void delayed(int milliseconds, Function() callback)

/// 监听事件总线
StreamSubscription<T> eventListen<T>(
  void Function(T)? onData, {
  Function? onError,
  void Function()? onDone,
  bool? cancelOnError,
})

/// 发送事件总线
sendEvent<T>(T event)

/// 刷新App所有页面
void refreshAppui()

/// 统一Log输出
void log(String log, [String? tag])

/// 切换主题模式
void changeThemeMode(ThemeMode themeMode)

/// 更改语言
void changeLanguage(Locale locale)

/// 打开网页
void openWebPage(String url, {LaunchMode mode = LaunchMode.platformDefault})

/// 拨打电话
void callPhone(String phoneNumber)

/**
 * 需要在App启动后调用
 */

/// 获取包信息
Future<PackageInfo> getPackageInfo()

/// 获取AppName
Future<String> getAppName()

/// 获取PackageName
Future<String> getPackageName()

/// 获取Version
Future<String> getVersion()

/// 获取BuildNumber
Future<String> getBuildNumber()

/// 获取设备信息
Future<BaseDeviceInfo> getDeviceInfo()

// 获取设备名称
Future<String?> getDeviceName()

// 获取系统版本
Future<String?> getDeviceSystemVersion()

/// 隐藏输入法
void hideKeyboard()

/// Change status bar Color and Brightness
Future<void> setStatusBarColor(
  Color statusBarColor, {
  Color? systemNavigationBarColor,
  Brightness? statusBarBrightness,
  Brightness? statusBarIconBrightness,
  int delayInMilliSeconds = 200,
})

/// Dark Status Bar
void setDarkStatusBar()

/// Light Status Bar
void setLightStatusBar()

/// This function will show status bar
Future<void> showStatusBar()

// Enter FullScreen Mode (Hides Status Bar and Navigation Bar)
void enterFullScreen()

// Unset Full Screen to normal state (Now Status Bar and Navigation Bar Are Visible)
void exitFullScreen()

/// This function will hide status bar
Future<void> hideStatusBar()

/// Set orientation to portrait
void setOrientationPortrait()

/// Set orientation to landscape
void setOrientationLandscape()

```
