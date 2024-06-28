import 'package:getx_scaffold/common/extensions/ex_date_time.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 全局方法
 */

///获取当前时间戳(Millisecond)
int getTimeStamp({bool isSecond = false}) {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  if (isSecond) {
    timestamp = timestamp ~/ 1000;
  }
  return timestamp;
}

///获取当前时间戳(Second)
int getTimeStampSecond() {
  return getTimeStamp(isSecond: true);
}

///获取当前日期字符串
String getNowDateString() {
  return DateTime.now().toDateString();
}

///获取当前日期时间字符串
String getNowDateTimeString() {
  return DateTime.now().toDateTimeString();
}

///获取当前时间字符串
String getNowTimeString() {
  return DateTime.now().toTimeString();
}
