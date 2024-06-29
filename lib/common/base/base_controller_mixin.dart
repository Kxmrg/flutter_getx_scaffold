import 'dart:async';

import 'package:getx_scaffold/getx_scaffold.dart';

mixin BaseControllerMixin on GetxController {
  @protected
  String get getBuilderId;

  late StreamSubscription refreshUiSubscription;

  @override
  void onInit() {
    super.onInit();
    refreshUiSubscription = eventBusListen((event) {
      updateUi();
    });
  }

  @override
  void onClose() {
    refreshUiSubscription.cancel();
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
    update([getBuilderId]);
  }
}
