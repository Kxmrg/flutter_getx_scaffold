import 'package:getx_scaffold/getx_scaffold.dart';

class ThemeController extends GetxController with BaseControllerMixin {
  @override
  String get getBuilderId => 'theme';

  ThemeController();

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
