import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-29
 * @description: 
 */

/// 全局服务
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
