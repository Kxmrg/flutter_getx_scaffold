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
class Logger {
  static bool _debug = false;
  static String _tag = 'Logger';
  static String _networkTag = 'Dio';

  static void init(bool isDebug, String? tag, String? networkTag) {
    _debug = isDebug;
    _tag = tag ?? 'Logger';
    _networkTag = networkTag ?? 'Dio';
  }

  static void d(String message, [String? tag]) {
    if (_debug) {
      log(message, name: tag ?? _tag);
    }
  }

  static void network(String message, [String? tag]) {
    if (_debug) {
      log(message, name: tag ?? _networkTag);
    }
  }
}
