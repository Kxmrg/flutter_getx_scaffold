import 'package:getx_scaffold/getx_scaffold.dart';

class BaseWidgetsController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'baseWidgets';

  BaseWidgetsController();

  int number = 0;

  void increment() {
    number++;
    updateUi();
  }
}
