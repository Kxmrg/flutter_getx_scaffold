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

/// 扩展String
extension ExString on String? {
  /// 是否为空或null
  bool get isEmptyOrNull => _isEmptyOrNull();

  /// 是否不为空或null
  bool get isNotEmptyOrNull => !_isEmptyOrNull();

  bool _isEmptyOrNull() {
    if (this == null) {
      return true;
    }
    return this!.isEmpty;
  }

  /// 格式化时间字符串
  String? dateFormat(String pattern) {
    if (this == null) {
      return null;
    }
    var date = DateTime.parse(this!);
    return date.dateFormat(pattern);
  }

  /// 格式化时间字符串为日期
  String? toDateString() {
    return dateFormat(DateFormats.y_mo_d);
  }

  /// 格式化时间字符串为日期时间
  String? toDateTimeString() {
    return dateFormat(DateFormats.full);
  }

  /// 格式化时间字符串为时间
  String? toTimeString() {
    return dateFormat(DateFormats.h_m_s);
  }

  /// 获取DateTime对象
  DateTime? getDateTime({bool? isUtc}) {
    if (this == null) {
      return null;
    }
    DateTime? dateTime = DateTime.tryParse(this!);
    if (isUtc != null) {
      if (isUtc) {
        dateTime = dateTime?.toUtc();
      } else {
        dateTime = dateTime?.toLocal();
      }
    }
    return dateTime;
  }

  /// MD5散列
  String? md5() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.encodeMd5(this!);
  }

  /// SHA1散列
  String? sha1() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.encodeSha1(this!);
  }

  /// SHA256散列
  String? sha256() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.encodeSha256(this!);
  }

  /// SHA512散列
  String? sha512() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.encodeSha512(this!);
  }

  /// Base64编码
  String? encodeBase64() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.encodeBase64(this!);
  }

  /// Base64解码
  String? decodeBase64() {
    if (this == null) {
      return null;
    }
    return EncryptUtil.decodeBase64(this!);
  }

  //转为金额字符串
  String? toPrice(
    int amount, {
    MoneyFormats format = MoneyFormats.NORMAL,
    MoneyUnit unit = MoneyUnit.NORMAL,
  }) {
    if (this == null) {
      return null;
    }
    return MoneyUtil.changeFStr2YWithUnit(
      this!,
      format: format,
      unit: unit,
    );
  }

  /// 转为int类型
  int? toInt({int defValue = 0}) {
    if (this == null) {
      return null;
    }
    return int.tryParse(this!) ?? defValue;
  }

  /// 转为double类型
  double? toDouble({double defValue = 0}) {
    if (this == null) {
      return null;
    }
    return double.tryParse(this!) ?? defValue;
  }

  /// 转为num类型
  num? toNumber({num defValue = 0}) {
    if (this == null) {
      return null;
    }
    return num.tryParse(this!) ?? defValue;
  }

  /// 判断是否为手机号(简易验证)
  bool isMobileSimple() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isMobileSimple(this!);
  }

  /// 判断是否为手机号(严格验证)
  bool isMobileExact() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isMobileExact(this!);
  }

  /// 判断是否为座机号码
  bool isTel() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isTel(this!);
  }

  /// 判断是否为身份证号码
  bool isIDCard18() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isIDCard18Exact(this!);
  }

  /// 判断是否成年
  bool isAdult() {
    if (this == null) {
      return false;
    }
    if (!RegexUtil.isIDCard18Exact(this!)) {
      return false;
    }

    // 解析身份证号码获取生日
    String birthDateString = this!.substring(6, 14);
    // 分别截取年月日
    int selectYear = int.parse(birthDateString.substring(0, 4));
    int selectMonth = int.parse(birthDateString.substring(4, 6));
    int selectDay = int.parse(birthDateString.substring(6, 8));
    // 获取当前年月日
    DateTime now = DateTime.now();
    int yearNow = now.year;
    int monthNow = now.month;
    int dayNow = now.day;
    // 用当前年减去出生年，例如2019-1-22 ，出生年日月是2011年-6-1
    //当前值是8
    int yearMinus = yearNow - selectYear;
    //当前值是-5，monthMinus大于0的情况下，证明满8周岁。等于0需要判断dayMinus，小于0的时候age-1
    int monthMinus = monthNow - selectMonth;
    //当前值是21，monthMinus大于0的情况下，配合monthMinus等于0的情况下，age等于原值。否则age等于age-1
    int dayMinus = dayNow - selectDay;
    // 先大致赋值
    int age = yearMinus;
    if (age <= 0) {
      age = 0;
    }
    if (monthMinus == 0) {
      if (dayMinus <= 0) {
        age = age - 1;
      }
    } else if (monthMinus < 0) {
      age = age - 1;
    }
    return age >= 18;
  }

  /// 判断是否为Email
  bool isEmail() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isEmail(this!);
  }

  /// 判断是否为Url
  bool isURL() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isURL(this!);
  }

  /// 判断是否为IP
  bool isIP() {
    if (this == null) {
      return false;
    }
    return RegexUtil.isIP(this!);
  }
}
