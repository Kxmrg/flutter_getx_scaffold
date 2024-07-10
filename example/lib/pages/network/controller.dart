import 'package:getx_scaffold/getx_scaffold.dart';

class NetworkController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'network';

  CancelToken? cancelToken;

  NetworkController();
}
