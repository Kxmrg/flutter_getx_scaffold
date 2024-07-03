import 'package:flutter/material.dart';
import 'package:example/common/langs/index.dart';
import 'package:example/pages/language/index.dart';
import 'package:example/pages/theme/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: Text(TextKey.zhuTi.tr),
        onTap: () {
          Get.to(() => const ThemePage());
        },
      ),
      ListTile(
        title: Text(TextKey.yuYan.tr),
        onTap: () {
          Get.to(() => const LanguagePage());
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'home',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("GetxScaffold"), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
