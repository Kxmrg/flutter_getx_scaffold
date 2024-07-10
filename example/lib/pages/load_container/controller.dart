import 'package:getx_scaffold/getx_scaffold.dart';

class LoadContainerController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'loadContainer';

  LoadController? loadController = LoadController();

  @override
  void onInit() {
    super.onInit();
    onLoad();
  }

  @override
  void onClose() {
    super.onClose();
    loadController?.dispose();
    loadController = null;
  }

  void onLoad() {
    loadController?.loading();
    delayed(3000, () => loadController?.complete());
  }

  void onEmpty() {
    loadController?.loading();
    delayed(3000, () => loadController?.empty());
  }

  void onError() {
    loadController?.loading();
    delayed(3000, () => loadController?.error());
  }
}
