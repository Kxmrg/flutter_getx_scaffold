import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 
 */

/// 初始化脚手架
Future<void> init({
  bool isDebug = false,
  String? logTag,
  int? dioTimeOut,
}) async {
  LogUtil.init(isDebug, logTag);
  Loading.init();
  await Get.putAsync(() => HttpService().init(timeout: dioTimeOut));
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
