import 'package:flutter/services.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-04
 * @description: 
 */

/// 返回回调
typedef DoublePressBackCallback = bool Function();

/// DoublePressBackWidget
// ignore: must_be_immutable
class DoublePressBackWidget extends StatelessWidget {
  final Widget child;
  final String? message;
  final DoublePressBackCallback? backCallback;

  DateTime? _currentBackPressTime;

  DoublePressBackWidget({
    super.key,
    required this.child,
    this.message,
    this.backCallback,
  });

  // 返回键退出
  bool closeOnConfirm() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      showToast(message ?? 'Press back again to exit');
      return false;
    }
    _currentBackPressTime = null;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, value) async {
        if (didPop) {
          return;
        }
        if (closeOnConfirm()) {
          if (backCallback?.call() ?? true) {
            SystemNavigator.pop();
          }
        }
      },
      child: child,
    );
  }
}
