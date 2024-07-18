import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class PermissionPage extends GetView<PermissionController> {
  const PermissionPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text('申请相机权限'),
        onTap: () async {
          if (await requestCameraPermission()) {
            showSuccessToast('已获取相机权限');
          }
        },
      ),
      ListTile(
        title: const Text('申请相册权限'),
        onTap: () async {
          if (await requestPhotosPermission()) {
            showSuccessToast('已获取相册权限');
          }
        },
      ),
      ListTile(
        title: const Text('申请麦克风权限'),
        onTap: () async {
          var result = await requestPermission(
            permission: Permission.microphone,
            message: '我们申请使用您设备的麦克风权限，用于拍摄录音',
            error: '请授权麦克风权限',
          );
          if (result) {
            showSuccessToast('已获取麦克风权限');
          }
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionController>(
      init: PermissionController(),
      id: 'permission',
      builder: (_) {
        return Scaffold(
          appBar:
              AppBar(title: Text(TextKey.shenQingQuanXian.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
