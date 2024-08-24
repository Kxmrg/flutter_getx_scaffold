import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
 * @date: 2024-06-28
 * @description: 
 */
/// 插件包名
const String pluginPackageName = 'getx_scaffold';

late final bool isDebugMode;

/// 初始化脚手架
Future<WidgetsBinding> init({
  bool isDebug = false,
  String? logTag,
  String? networkLog,
  int dioTimeOut = 10,
  List<Locale>? supportedLocales,
}) async {
  isDebugMode = isDebug;
  Logger.init(isDebugMode, logTag, networkLog);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
      () => GlobalService().init(supportedLocales: supportedLocales));
  await Get.putAsync(() => HttpService().init(timeout: dioTimeOut));
  return widgetsBinding;
}

/// 获取当前时间戳(Millisecond)
int getTimeStamp({bool isSecond = false}) {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  if (isSecond) {
    timestamp = timestamp ~/ 1000;
  }
  return timestamp;
}

/// 获取当前时间戳(Second)
int getTimeStampSecond() {
  return getTimeStamp(isSecond: true);
}

/// 获取当前日期字符串
String getNowDateString() {
  return DateTime.now().toDateString();
}

/// 获取当前日期时间字符串
String getNowDateTimeString() {
  return DateTime.now().toDateTimeString();
}

/// 获取当前时间字符串
String getNowTimeString() {
  return DateTime.now().toTimeString();
}

/// 判断设备是否连接网络
Future<bool> isNetworkAvailable() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return !connectivityResult.contains(ConnectivityResult.none);
}

/// 判断设备是否连接移动网络
Future<bool> isConnectedToMobile() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult.contains(ConnectivityResult.mobile);
}

/// 判断设备是否连接WiFi
Future<bool> isConnectedToWiFi() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult.contains(ConnectivityResult.wifi);
}

/// 显示Toast
void showToast(String msg) {
  Toast.show(msg);
}

/// 显示成功Toast
void showSuccessToast(String msg) {
  Toast.success(msg);
}

/// 显示提示Toast
void showInfoToast(String msg) {
  Toast.info(msg);
}

/// 显示警告Toast
void showWarningToast(String msg) {
  Toast.warning(msg);
}

/// 显示错误Toast
void showErrorToast(String msg) {
  Toast.error(msg);
}

/// 显示loading
void showLoading([String? msg]) {
  Loading.show(msg);
}

/// 显示成功
void showSuccess([String? msg]) {
  Loading.success(msg);
}

/// 显示错误
void showError([String? msg]) {
  Loading.error(msg);
}

/// 显示提示
void showInfo(String msg) {
  Loading.showInfo(msg);
}

/// 隐藏loading
void dismissLoading() {
  Loading.dismiss();
}

/// 延时执行
void delayed(int milliseconds, Function() callback) {
  Future.delayed(Duration(milliseconds: milliseconds), callback);
}

/// 返回全局事件总线
EventBus get eventBus => GlobalService.to.eventBus;

/// 监听事件总线
StreamSubscription<T> eventListen<T>(
  void Function(T)? onData, {
  Function? onError,
  void Function()? onDone,
  bool? cancelOnError,
}) {
  return eventBus.on<T>().listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );
}

/// 发送事件总线
sendEvent<T>(T event) {
  eventBus.fire(event);
}

/// 刷新App所有页面
void refreshAppui() {
  sendEvent(const RefreshUiEvent());
}

/// 返回sharedPreferences
SharedPreferences get sharedPreferences => GlobalService.to.sharedPreferences;

/// 统一Log输出
void log(String log, [String? tag]) {
  Logger.d(log, tag);
}

/// 切换主题模式
void changeThemeMode(ThemeMode themeMode) {
  GlobalService.to.changeThemeMode(themeMode);
}

/// 更改语言
void changeLanguage(Locale locale) {
  GlobalService.to.changeLocale(locale);
}

/// 打开网页
void openWebPage(String url, {LaunchMode mode = LaunchMode.platformDefault}) {
  launchUrl(Uri.parse(url), mode: mode);
}

/// 拨打电话
void callPhone(String phoneNumber) {
  launchUrl(Uri.parse('tel:$phoneNumber'));
}

/**
 * 需要在App启动后调用
 */

/// 获取包信息
Future<PackageInfo> getPackageInfo() async {
  return await GlobalService.to.getPackageInfo();
}

/// 获取AppName
Future<String> getAppName() async {
  PackageInfo packageInfo = await getPackageInfo();
  return packageInfo.appName;
}

/// 获取PackageName
Future<String> getPackageName() async {
  PackageInfo packageInfo = await getPackageInfo();
  return packageInfo.packageName;
}

/// 获取Version
Future<String> getVersion() async {
  PackageInfo packageInfo = await getPackageInfo();
  return packageInfo.version;
}

/// 获取BuildNumber
Future<String> getBuildNumber() async {
  PackageInfo packageInfo = await getPackageInfo();
  return packageInfo.buildNumber;
}

/// 获取设备信息
Future<BaseDeviceInfo> getDeviceInfo() async {
  return await GlobalService.to.getDeviceInfo();
}

// 获取设备型号
Future<String?> getDeviceModel() async {
  BaseDeviceInfo deviceInfo = await getDeviceInfo();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo =
        AndroidDeviceInfo.fromMap(deviceInfo.data);
    return '${androidDeviceInfo.brand} ${androidDeviceInfo.model}';
  }
  if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = IosDeviceInfo.fromMap(deviceInfo.data);
    return iosDeviceInfo.utsname.machine;
  }
  return null;
}

// 获取 IOS系统版本
Future<String?> getIosSystemVersion() async {
  if (Platform.isIOS) {
    BaseDeviceInfo deviceInfo = await getDeviceInfo();
    IosDeviceInfo iosDeviceInfo = IosDeviceInfo.fromMap(deviceInfo.data);
    return iosDeviceInfo.systemVersion;
  }
  return null;
}

// 获取Android SDK Version
Future<int?> getAndroidSdkVersion() async {
  if (Platform.isAndroid) {
    BaseDeviceInfo deviceInfo = await getDeviceInfo();
    AndroidDeviceInfo androidDeviceInfo =
        AndroidDeviceInfo.fromMap(deviceInfo.data);
    return androidDeviceInfo.version.sdkInt;
  }
  return null;
}

/// 隐藏输入法
void hideKeyboard() => FocusScope.of(Get.context!).requestFocus(FocusNode());

/// Change status bar Color and Brightness
Future<void> setStatusBarColor(
  Color statusBarColor, {
  Color? systemNavigationBarColor,
  Brightness? statusBarBrightness,
  Brightness? statusBarIconBrightness,
  int delayInMilliSeconds = 200,
}) async {
  await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      systemNavigationBarColor: systemNavigationBarColor,
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarIconBrightness ??
          (statusBarColor.isDark() ? Brightness.light : Brightness.dark),
    ),
  );
}

/// Dark Status Bar
void setDarkStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

/// Light Status Bar
void setLightStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
}

/// This function will show status bar
Future<void> showStatusBar() async {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

// Enter FullScreen Mode (Hides Status Bar and Navigation Bar)
void enterFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

// Unset Full Screen to normal state (Now Status Bar and Navigation Bar Are Visible)
void exitFullScreen() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

/// This function will hide status bar
Future<void> hideStatusBar() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

/// Set orientation to portrait
void setOrientationPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

/// Set orientation to landscape
void setOrientationLandscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

/// 申请权限
Future<bool> requestPermission({
  required Permission permission,
  String? title,
  String? confirmText,
  required String message,
  required String error,
}) async {
  return await PermissionUtil.request(
    permission: permission,
    title: title,
    confirmText: confirmText,
    message: message,
    error: error,
  );
}

/// 申请相机权限
Future<bool> requestCameraPermission() async {
  return await PermissionUtil.camera();
}

/// 申请相册权限
Future<bool> requestPhotosPermission() async {
  return await PermissionUtil.photos();
}

/// 申请蓝牙权限 仅Android需要申请 IOS默认开启
Future<bool> requestBluetoothPermission() async {
  return await PermissionUtil.bluetooth();
}

/// 生成32位唯一字符串
String generateNonce() {
  int timestamp = getTimeStamp();
  int randomNumber = generateRandomNumber(6);
  return '$timestamp$randomNumber'.md5() ?? '';
}

/// 生成随机数
int generateRandomNumber(int length) {
  final Random random = Random();
  final minValue = pow(10, length - 1).toInt();
  final maxValue = pow(10, length).toInt() - 1;
  final randomNumber = minValue + random.nextInt(maxValue - minValue + 1);
  return randomNumber;
}
