import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class DialogPage extends GetView<DialogController> {
  const DialogPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text('确认对话框'),
        onTap: () {
          DialogX.instance.showConfirmDialog(
            title: '提示',
            messgae: '你确定要删除该条记录吗？',
          );
        },
      ),
      ListTile(
        title: const Text('通用提示对话框'),
        onTap: () {},
      ),
      ListTile(
        title: const Text('强提示警告对话框'),
        onTap: () {},
      ),
      ListTile(
        title: const Text('菜单对话框'),
        onTap: () {},
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogController>(
      init: DialogController(),
      id: 'dialog',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.duiHuaKuang.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
