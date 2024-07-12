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

## 扩展方法

#### String?扩展：

```dart
/// 是否为空或null
bool get isEmptyOrNull => _isEmptyOrNull();

/// 是否不为空或null
bool get isNotEmptyOrNull => !_isEmptyOrNull();

/// 格式化时间字符串
String? dateFormat(String pattern)

/// 格式化时间字符串为日期
String? toDateString()

/// 格式化时间字符串为日期时间
String? toDateTimeString()

/// 格式化时间字符串为时间
String? toTimeString()

/// 获取DateTime对象
DateTime? getDateTime({bool? isUtc})

/// MD5加密
String? md5()

/// Base64编码
String? encodeBase64()

/// Base64解码
String? decodeBase64()

//转为金额字符串
String? toPrice(
int amount, {
MoneyFormats format = MoneyFormats.NORMAL,
MoneyUnit unit = MoneyUnit.NORMAL,
})

/// 转为int类型
int? toInt({int defValue = 0})

/// 转为double类型
double? toDouble({double defValue = 0})

/// 转为num类型
num? toNumber({num defValue = 0})

/// 判断是否为手机号(简易验证)
bool isMobileSimple()

/// 判断是否为手机号(严格验证)
bool isMobileExact()

/// 判断是否为座机号码
bool isTel()

/// 判断是否为身份证号码
bool isIDCard18()

/// 判断是否成年
bool isAdult()

/// 判断是否为Email
bool isEmail()

/// 判断是否为Url
bool isURL()

/// 判断是否为IP
bool isIP()

```

#### num?扩展：

```dart
/// 根据格式将时间戳(Milliseconds)格式化日期
String? dateFormat(String pattern, {bool isSecond = false})

/// 将时间戳(Milliseconds)格式化日期
String? toDateString({bool isSecond = false})

/// 将时间戳(Milliseconds)格式化日期时间
String? toDateTimeString({bool isSecond = false})

/// 将时间戳(Milliseconds)格式化时间
String? toTimeString({bool isSecond = false})

/// 将字节转为容量单位
String? toFileSize({int decimals = 0})

/// 时间戳(Milliseconds)距离当前的时间
String? getTimeDifference({bool isShowDay = true, bool isSecond = false})

/// 时间戳(Milliseconds)距离当前的时间描述
String? getTimeDifferenceDescription({bool isSecond = false})

/// 转为金额字符串
String? toPrice(
int amount, {
MoneyFormats format = MoneyFormats.NORMAL,
MoneyUnit unit = MoneyUnit.NORMAL,
})

/// 加 (精确相加,防止精度丢失).
/// add (without loosing precision).
double? add(num value)

/// 减 (精确相减,防止精度丢失).
/// subtract (without loosing precision).
double? subtract(num value)

/// 乘 (精确相乘,防止精度丢失).
/// multiply (without loosing precision).
double? multiply(num value)

/// 除 (精确相除,防止精度丢失).
/// divide (without loosing precision).
double? divide(num value)

/// 间距
Widget spacing()

```

#### List<Widget>扩展

```dart
/// 转 Wrap
Widget toWrap();

/// 转 Column
Widget toColumn();

/// 转 Row
Widget toRow();

/// 转 ListView
Widget toListView()

// 转 Stack
Widget toStack();

// 使用示例：
Widget _buildView() {
    return <Widget>[
        ListTile(
        title: Text(TextKey.genSuiXiTong.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.system
            ? const Icon(Icons.check)
            : null,
        onTap: () {
            changeThemeMode(ThemeMode.system);
        },
        ),
        ListTile(
        title: Text(TextKey.liangSeZhuTi.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.light
            ? const Icon(Icons.check)
            : null,
        onTap: () {
            changeThemeMode(ThemeMode.light);
        },
        ),
        ListTile(
        title: Text(TextKey.anSeZhuTi.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.dark
            ? const Icon(Icons.check)
            : null,
        onTap: () {
            changeThemeMode(ThemeMode.dark);
        },
        ),
    ].toListView(
        separator: const DividerX(),
    );
}

```

#### Widget 扩展：

```dart
/// 控制组件隐藏显示
Widget visibility();

/// 比例布局
Widget aspectRatio();

/// 卡片布局
Widget card();

/// 居中布局
Widget center();

/// 裁剪圆形
Widget clipOval();

/// 裁剪矩形
Widget clipRect();

/// 裁剪圆角
Widget clipRRect();

/// 阴影
Widget elevation();

/// expand
Widget expand();

/// 缩放布局
Widget fittedBox();

/// 弹性布局
Widget flexible();

/// 百分比布局
Widget fractionallySizedBox();

/// 限制盒子 最大宽高
Widget limitedBox();

/// 偏移
Widget offstage();

/// 透明度
Widget opacity();

/// 溢出
Widget overflow();

/// Stack布局 位置
Widget positioned();

/// 墨水纹
Widget inkWell();

/// 涟漪
Widget ripple();

/// 比例缩放
Widget scale();

/// 滚动视图
Widget scrollable();

/// 滚动条
Widget scrollbar();

/// Transforms Matrix4
Widget transform();

/// Translate 变化位置
Widget translate();

/// 约束
Widget constrained();

/// 约束宽高
Widget tight();

/// 约束宽度
Widget width();

/// 约束高度
Widget height();

/// 取消父级约束
Widget unConstrained();

/// 安全区域
Widget safeArea();

/// 对齐
Widget align();

/// 对齐 上左边
Widget alignTopLeft();

/// 对齐 顶部居中
Widget alignTopCenter();

/// 对齐 上右边
Widget alignTopRight();

/// 对齐 左边
Widget alignCenterLeft();

/// 对齐 中间
Widget alignCenter();

/// 对齐 右边
Widget alignCenterRight();

/// 对齐 下左边
Widget alignBottomLeft();

/// 对齐 底部
Widget alignBottomCenter();

/// 对齐 下右边
Widget alignBottomRight();

/// 盒子装饰器
Widget decorated();

/// 背景颜色
Widget backgroundColor();

/// 边框
Widget border();

/// 阴影
Widget boxShadow();

/// 手势
Widget gestures();

/// 点击
Widget onTap();

/// 内间距
Widget padding();

/// Sliver 内间距
Widget sliverPadding();

/// 内间距 纵向
Widget sliverPaddingVertical(double val);

/// 内间距 横向
Widget sliverPaddingHorizontal(double val);

/// 内间距 上
Widget sliverPaddingTop(double val);

/// 内间距 下
Widget sliverPaddingBottom(double val);

/// 内间距 左
Widget sliverPaddingLeft(double val);

/// 内间距 右
Widget sliverPaddingRight(double val);

/// SliverToBoxAdapter
Widget sliver();

```

## Widgets

GetXScaffold 并不是一个 UI 组件库，里面仅封装了最常用的一些组件并优化了使用方法。如有其他需求请按需引入其他组件库。

```dart
// Text
TextX.titleLarge('Text');
TextX.labelLarge('Text');
TextX.bodySmall('Text');

// Button
ButtonX.primary('Button');
ButtonX.outline('Button');
ButtonX.text('Button');
ButtonX.icon(Icons.add);

// Icon
IconX.icon(Icons.add);
IconX.image('path');
IconX.svg('path');

// Image
ImageX.url('http://a.com');
ImageX.asset('path');
ImageX.file('path');

// TextTag
TextTag('tag');

// NavigationX
Widget _buildNavigationBar() {
    return NavigationX(
        currentIndex: controller.pageIndex, // 当前选中的tab索引
        onTap: (index) {
            controller.pageIndex = index;
            controller.updateUi();
        }, // 切换tab事件
        items: [
            NavigationItemModel(
                label: '首页',
                icon: AntdIcon.home,
                selectedIcon: AntdIcon.home_fill,
                dot: true,
            ),
            NavigationItemModel(
                label: '日历',
                icon: AntdIcon.calendar,
                selectedIcon: AntdIcon.calendar_fill,
                badge: '18',
            ),
            NavigationItemModel(
                label: '设置',
                icon: AntdIcon.setting,
                selectedIcon: AntdIcon.setting_fill,
            ),
            NavigationItemModel(
                label: '设置',
                icon: AntdIcon.setting,
                selectedIcon: AntdIcon.setting_fill,
            ),
        ],
    );
}

// 双击返回
DoublePressBackWidget(
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

// 保持状态
KeepAliveWrapper(
    keepAlive: true,
    child: MainPage(),
);

.....

```

#### LoadContainer
内置了加载中，网络错误，空数据三种状态，通过控制器进行切换。每种状态的Widget可以自定义。

```dart
import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class LoadContainerPage extends GetView<LoadContainerController> {
  const LoadContainerPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextX.titleLarge('Page contents'),
      ButtonX(
        'Show Load Error',
        onPressed: () => controller.onError(),
      ).width(double.infinity).padding(top: 30.h, horizontal: 50.w),
      ButtonX(
        'Show Load Empty',
        onPressed: () => controller.onEmpty(),
      ).width(double.infinity).padding(top: 10.h, horizontal: 50.w),
    ].toColumn(mainAxisSize: MainAxisSize.min).center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadContainerController>(
      init: LoadContainerController(),
      id: 'loadContainer',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.zhuTi.tr), elevation: 1),
          body: SafeArea(
            child: LoadContainer(
              controller: controller.loadController!,
              onReLoad: controller.onLoad,
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}

```

```dart
import 'package:getx_scaffold/getx_scaffold.dart';

class LoadContainerController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'loadContainer';

  LoadController? loadController = LoadController();

  @override
  void onInit() {
    super.onInit();
    onLoad();
  }

  @override
  void onClose() {
    super.onClose();
    loadController?.dispose();
    loadController = null;
  }

  void onLoad() {
    loadController?.loading();
    delayed(3000, () => loadController?.complete());
  }

  void onEmpty() {
    loadController?.loading();
    delayed(3000, () => loadController?.empty());
  }

  void onError() {
    loadController?.loading();
    delayed(3000, () => loadController?.error());
  }
}
```


#### AntdIcon

脚手架中引入了 AntDesign 图标库，可以直接通过 AntdIcon.xxx 使用。[查看全部图标](https://www.iconfont.cn/collections/detail?spm=a313x.collections_index.i1.d9df05512.2f663a81stAHOv&cid=9402)

```dart
AntdIcon.home
AntdIcon.home_fill
......

```

#### Dialog

```dart
// 显示确认弹窗
DialogX.to.showConfirmDialog();

// 显示通知弹窗
DialogX.to.showNoticeDialog();

// 显示提示弹窗
DialogX.to.showPromptDialog();

// 显示菜单弹窗
DialogX.to.showMenuDialog();
```

## Utils
整合了common_utils库和nb_utils库中的常用工具类，并补全了RSAUtils等工具类。
1. DateUtil : 日期转换格式化输出。
2. EncryptUtil : 异或对称加/解密，md5加密，Base64加/解密。
3. JsonUtil : 简单封装json字符串转对象。
4. JwtDecoder : jwt解析。
5. LogUtil : 全局log控制。
6. MoneyUtil : 精确转换，元转分，分转元，支持格式输出。
7. NumUtil : 保留x位小数, 精确加、减、乘、除, 防止精度丢失。
8. ObjectUtil : 判断对象是否为空(String List Map),判断两个List是否相等。
9. RegexUtil : 正则验证手机号，身份证，邮箱等等。
10. RSAUtils : RSA加密解密验签。
11. TextUtil : 银行卡号每隔4位加空格，每隔3三位加逗号，隐藏手机号等等。
12. TimelineUtil : 时间轴。
13. TimerUtil : 倒计时，定时任务。
