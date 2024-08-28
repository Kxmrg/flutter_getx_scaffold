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
          DialogX.to.showConfirmDialog(
            title: '提示',
            message: '你确定要删除该条记录吗？',
            onConfirm: () {
              showSuccessToast('Confirm');
            },
            onCancel: () {
              showErrorToast('Cancel');
            },
          );
        },
      ),
      ListTile(
        title: const Text('自定义对话框组件'),
        onTap: () {
          DialogX.to.showConfirmDialog(
            icon: DialogIcon.warn,
            content: _buildDialogContent(),
            confirmText: '同意',
            cancelText: '拒绝',
          );
        },
      ),
      ListTile(
        title: const Text('通用提示对话框'),
        onTap: () {
          DialogX.to.showNoticeDialog(
            icon: DialogIcon.info,
            message: '这是一条系统公告，请关注。',
            confirmText: '关闭',
          );
        },
      ),
      ListTile(
        title: const Text('强提示警告对话框'),
        onTap: () {
          DialogX.to.showPromptDialog(
            title: '强提醒标题',
            message: '强提醒内容强提醒内容强提醒内容强提醒内容强提醒内容强提醒内容强提醒内容强提醒内容。',
            confirmText: '主要操作按钮',
            cancelText: '次要操作按钮',
          );
        },
      ),
      ListTile(
        title: const Text('菜单对话框'),
        onTap: () {
          DialogX.to.showMenuDialog(title: 'MENU DIALOG', menus: [
            DialogMenuItem(
                title: 'Home',
                icon: AntdIcon.home,
                onTap: () {
                  showToast('click');
                }),
            DialogMenuItem(
                title: 'Camera',
                icon: AntdIcon.camera,
                onTap: () {
                  showToast('click');
                }),
            DialogMenuItem(
                title: 'Item',
                subTitle: 'username: admin',
                onTap: () {
                  showToast('click');
                }),
            DialogMenuItem(
                title: 'item',
                onTap: () {
                  showToast('click');
                }),
            DialogMenuItem(
                title: 'item',
                onTap: () {
                  showToast('click');
                }),
          ]);
        },
      ),
      ListTile(
        title: const Text('滑动验证码对话框'),
        onTap: () {
          DialogX.to.showCaptchaDialog(
            [
              'assets/images/captcha_bg1.jpg',
              'assets/images/captcha_bg2.jpg',
              'assets/images/captcha_bg3.jpg',
              'assets/images/captcha_bg4.jpg',
            ],
            (result) {
              if (result) {
                showSuccessToast('通过验证');
              } else {
                showErrorToast('验证失败');
              }
            },
          );
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  Widget _buildDialogContent() {
    return RichTextX(children: [
      TextSpanItem('请阅读并同意'),
      TextSpanItem(
        '《隐私协议》',
        onTap: () => openWebPage('https://baidu.com'),
      ),
      TextSpanItem('和'),
      TextSpanItem(
        '《用户政策》',
        onTap: () => openWebPage('https://baidu.com'),
      ),
      TextSpanItem('，我们将在协议框架内为您提供更优质的服务。'),
    ]);
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
