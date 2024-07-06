import 'package:getx_scaffold/getx_scaffold.dart';

class LoadingContainerController extends GetxController
    with BaseControllerMixin {
  @override
  String get builderId => 'loadingContainer';

  LoadController loadController = LoadController();

  @override
  void onInit() {
    super.onInit();
    onLoad();
  }

  @override
  void onClose() {
    loadController.dispose();
    super.onClose();
  }

  void onLoad() {
    loadController.loading();
    delayed(3000, () => loadController.complete());
  }
}
