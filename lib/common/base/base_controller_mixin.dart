import 'dart:async';

import 'package:getx_scaffold/getx_scaffold.dart';

mixin BaseControllerMixin on GetxController {
  @protected
  String get getBuilderId;

  late StreamSubscription refreshUiSubscription;

  @override
  void onInit() {
    super.onInit();
    refreshUiSubscription = eventBus.on<RefreshUiEvent>().listen((event) {
      updateUi();
    });
  }

  @override
  void onClose() {
    refreshUiSubscription.cancel();
    super.onClose();
  }

  void delayedBack({int seconds = 2, result}) {
    Future.delayed(Duration(seconds: seconds), () {
      if (result != null) {
        Get.back(result: result);
      } else {
        Get.back();
      }
    });
  }

  void updateUi() {
    update([getBuilderId]);
  }
}
