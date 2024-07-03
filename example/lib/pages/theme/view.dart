import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text("跟随系统"),
        trailing: GlobalService.to.themeMode == ThemeMode.system
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeThemeMode(ThemeMode.system);
        },
      ),
      ListTile(
        title: const Text("亮色主题"),
        trailing: GlobalService.to.themeMode == ThemeMode.light
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeThemeMode(ThemeMode.light);
        },
      ),
      ListTile(
        title: const Text("暗色主题"),
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
          appBar: AppBar(title: const Text("Theme"), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
