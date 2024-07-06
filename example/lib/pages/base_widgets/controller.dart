import 'package:getx_scaffold/getx_scaffold.dart';

class BaseWidgetsController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'baseWidgets';

  BaseWidgetsController();

  bool showDot = true;
  int number = 0;
  int pageIndex = 0;

  void increment() {
    number++;
    updateUi();
  }

  void updateDot() {
    showDot = !showDot;
    updateUi();
  }
}
