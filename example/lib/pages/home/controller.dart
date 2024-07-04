import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

class HomeController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'home';

  @override
  bool get listenLifecycleEvent => true;

  HomeController();

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }

  @override
  void onDetached() {
    log('onDetached');
  }

  @override
  void onHidden() {
    log('onHidden');
  }

  @override
  void onInactive() {
    log('onInactive');
  }

  @override
  void onPaused() {
    log('onPaused');
  }

  @override
  void onResumed() {
    log('onResumed');
  }
}
