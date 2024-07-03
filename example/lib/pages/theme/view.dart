import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: Text(TextKey.genSuiXiTong.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.system
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeThemeMode(ThemeMode.system);
        },
      ),
      ListTile(
        title: Text(TextKey.liangSeZhuTi.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.light
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeThemeMode(ThemeMode.light);
        },
      ),
      ListTile(
        title: Text(TextKey.anSeZhuTi.tr),
        trailing: GlobalService.to.themeMode == ThemeMode.dark
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeThemeMode(ThemeMode.dark);
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      id: 'theme',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.zhuTi.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
