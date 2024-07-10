import 'dart:math';
import 'package:getx_scaffold/getx_scaffold.dart' hide log;

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 
 */

/// 扩展Num
extension ExNum on num? {
  /// 根据格式将时间戳(Milliseconds)格式化日期
  String? dateFormat(String pattern, {bool isSecond = false}) {
    if (this == null) {
      return null;
    }
    num value = this!;
    if (isSecond) {
      value = value * 1000;
    }
    var date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    return date.dateFormat(pattern);
  }

  /// 将时间戳(Milliseconds)格式化日期
  String? toDateString({bool isSecond = false}) {
    return dateFormat(DateFormats.y_mo_d, isSecond: isSecond);
  }

  /// 将时间戳(Milliseconds)格式化日期时间
  String? toDateTimeString({bool isSecond = false}) {
    return dateFormat(DateFormats.full, isSecond: isSecond);
  }

  /// 将时间戳(Milliseconds)格式化时间
  String? toTimeString({bool isSecond = false}) {
    return dateFormat(DateFormats.h_m_s, isSecond: isSecond);
  }

  /// 将字节转为容量单位
  String? toFileSize({int decimals = 0}) {
    if (this == null) {
      return null;
    }
    if (this == 0) {
      return '0 B';
    }
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(this!) / log(1024)).floor();
    return '${(this! / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// 时间戳(Milliseconds)距离当前的时间
  String? getTimeDifference({bool isShowDay = true, bool isSecond = false}) {
    if (this == null) {
      return null;
    }
    int seconds = this!.toInt();
    if (!isSecond) {
      seconds = seconds ~/ 1000;
    }
    int day = 0;
    int hour = 0;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    if (isShowDay) {
      day = seconds ~/ 3600 ~/ 24;
      hour = seconds ~/ 3600 % 24;
    } else {
      hour = seconds ~/ 3600;
    }
    if (day != 0) {
      return '$day day ${_formatTime(hour)} : ${_formatTime(minute)} : ${_formatTime(second)}';
    } else if (hour != 0) {
      return '${_formatTime(hour)} : ${_formatTime(minute)} : ${_formatTime(second)}';
    } else if (minute != 0) {
      return '${_formatTime(minute)} : ${_formatTime(second)}';
    } else if (second != 0) {
      return '$second s';
    } else {
      return '';
    }
  }

  /// 时间戳(Milliseconds)距离当前的时间描述
  String? getTimeDifferenceDescription({bool isSecond = false}) {
    if (this == null) {
      return null;
    }
    int milliseconds = this!.toInt();
    if (isSecond) {
      milliseconds = milliseconds * 1000;
    }
    DateTime currentTime = DateTime.now();
    DateTime inputTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    Duration difference = currentTime.difference(inputTime);

    if (difference.inSeconds < 60) {
      return '刚刚';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}天前';
    } else if (difference.inDays < 365) {
      int months = currentTime.month - inputTime.month;
      if (months == 0) {
        return '1个月前';
      } else {
        return '$months个月前';
      }
    } else {
      int years = currentTime.year - inputTime.year;
      if (years == 1) {
        return '1年前';
      } else {
        return '$years年前';
      }
    }
  }

  /// 数字格式化，将 0~9 的时间转换为 00~09
  static String _formatTime(int timeNum) {
    return timeNum < 10 ? "0$timeNum" : timeNum.toString();
  }

  /// 转为金额字符串
  String? toPrice(
    int amount, {
    MoneyFormats format = MoneyFormats.NORMAL,
    MoneyUnit unit = MoneyUnit.NORMAL,
  }) {
    if (this == null) {
      return null;
    }
    return MoneyUtil.changeF2YWithUnit(
      this!.toInt(),
      format: format,
      unit: unit,
    );
  }

  /// 加 (精确相加,防止精度丢失).
  /// add (without loosing precision).
  double? add(num value) {
    if (this == null) {
      return null;
    }
    return NumUtil.addDec(this!, value).toDouble();
  }

  /// 减 (精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  double? subtract(num value) {
    if (this == null) {
      return null;
    }
    return NumUtil.subtractDec(this!, value).toDouble();
  }

  /// 乘 (精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  double? multiply(num value) {
    if (this == null) {
      return null;
    }
    return NumUtil.multiplyDec(this!, value).toDouble();
  }

  /// 除 (精确相除,防止精度丢失).
  /// divide (without loosing precision).
  double? divide(num value) {
    if (this == null) {
      return null;
    }
    return NumUtil.divideDec(this!, value).toDouble();
  }

  /// 间距
  Widget spacing() {
    if (this == null) {
      return const SizedBox();
    }
    return SizedBox(width: this!.toDouble());
  }
}
