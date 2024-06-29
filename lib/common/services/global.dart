import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find();
  late EventBus eventBus;
  late SharedPreferences sharedPreferences;

  Future<GlobalService> init() async {
    eventBus = EventBus();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}
