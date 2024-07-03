import 'dart:async';

import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-29
 * @description: 
 */

/// BaseControllerMixin
mixin BaseControllerMixin on GetxController {
  @protected
  String get builderId;

  late StreamSubscription refreshUiSubscription;

  late StreamSubscription lifecycleSubscription;

  @override
  void onInit() {
    super.onInit();
    refreshUiSubscription = eventBusListen<RefreshUiEvent>((event) {
      updateUi();
    });
    lifecycleSubscription = eventBusListen<LifecycleEvent>((event) {
      switch (event.state) {
        case AppLifecycleState.resumed:
          onResumed();
          break;
        case AppLifecycleState.inactive:
          onInactive();
          break;
        case AppLifecycleState.detached:
          onDetached();
          break;
        case AppLifecycleState.paused:
          onPaused();
          break;
        case AppLifecycleState.hidden:
          onHidden();
          break;
      }
    });
  }

  void onResumed() {}

  void onInactive() {}

  void onDetached() {}

  void onPaused() {}

  void onHidden() {}

  @override
  void onClose() {
    refreshUiSubscription.cancel();
    lifecycleSubscription.cancel();
    super.onClose();
  }

  /// 延时退出
  void delayedBack({int seconds = 2, result}) {
    Future.delayed(Duration(seconds: seconds), () {
      if (result != null) {
        Get.back(result: result);
      } else {
        Get.back();
      }
    });
  }

  /// 刷新UI
  void updateUi() {
    update([builderId]);
  }
}
