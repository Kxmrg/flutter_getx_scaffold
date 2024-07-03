import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text('简体中文'),
        trailing: GlobalService.to.locale == const Locale('zh', 'CN')
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeLanguage(const Locale('zh', 'CN'));
        },
      ),
      ListTile(
        title: const Text('English'),
        trailing: GlobalService.to.locale == const Locale('en', 'US')
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeLanguage(const Locale('en', 'US'));
        },
      ),
      ListTile(
        title: const Text('Spanish'),
        trailing: GlobalService.to.locale == const Locale('es', 'ES')
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          changeLanguage(const Locale('es', 'ES'));
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      id: 'language',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.yuYan.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
