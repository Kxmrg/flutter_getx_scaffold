import 'dart:developer';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 
 */

///日志工具
class LogUtil {
  static bool _debug = false;
  static String _tag = 'Logger';

  static void init(bool isDebug, String tag) {
    _debug = isDebug;
    _tag = tag;
  }

  static void d(String message) {
    if (_debug) {
      log(message, name: _tag);
    }
  }
}
