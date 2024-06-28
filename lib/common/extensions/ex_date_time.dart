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

/// 扩展DateTime
extension ExDateTime on DateTime {
  // 格式化DateTime
  String dateFormat(String pattern) {
    return DateFormat(pattern).format(this);
  }

  // 获取日期字符串
  String toDateString() {
    return dateFormat(DateFormats.y_mo_d);
  }

  // 获取日期时间字符串
  String toDateTimeString() {
    return dateFormat(DateFormats.full);
  }

  // 获取时间字符串
  String toTimeString() {
    return dateFormat(DateFormats.h_m_s);
  }
}
