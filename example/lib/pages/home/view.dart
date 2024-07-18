import 'dart:io';

import 'package:example/pages/base_widgets/index.dart';
import 'package:example/pages/dialog/index.dart';
import 'package:example/pages/load_container/index.dart';
import 'package:example/pages/network/index.dart';
import 'package:example/pages/permission/index.dart';
import 'package:example/pages/theme_color/index.dart';
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
      ListTile(
        title: Text(TextKey.jiChuZuJian.tr),
        onTap: () {
          Get.to(() => const BaseWidgetsPage());
        },
      ),
      ListTile(
        title: Text(TextKey.jiZaiRongQiZuJian.tr),
        onTap: () {
          Get.to(() => const LoadContainerPage());
        },
      ),
      ListTile(
        title: Text(TextKey.shiYongZhuTiSe.tr),
        onTap: () {
          Get.to(() => const ThemeColorPage());
        },
      ),
      ListTile(
        title: Text(TextKey.duiHuaKuang.tr),
        onTap: () {
          Get.to(() => const DialogPage());
        },
      ),
      ListTile(
        title: Text(TextKey.wangLuoQingQiu.tr),
        onTap: () {
          Get.to(() => const NetworkPage());
        },
      ),
      ListTile(
        title: Text(TextKey.shenQingQuanXian.tr),
        onTap: () {
          Get.to(() => const PermissionPage());
        },
      ),
      ListTile(
        title: Text(TextKey.huoQuDangQianShiJianChuo.tr),
        onTap: () async {
          showToast(getTimeStamp(isSecond: true).toString());
        },
      ),
      ListTile(
        title: Text(TextKey.shiJianChuoZhuanRiQi.tr),
        onTap: () async {
          showToast(getTimeStamp().toDateTimeString() ?? '');
        },
      ),
      ListTile(
        title: Text(TextKey.md5JiaMi.tr),
        onTap: () async {
          showToast(getNowDateString().md5() ?? '');
        },
      ),
      ListTile(
        title: Text(TextKey.base64BianMa.tr),
        onTap: () async {
          showToast(getNowDateString().encodeBase64() ?? '');
        },
      ),
      ListTile(
        title: Text(TextKey.yingYongBanBen.tr),
        onTap: () async {
          String version = await getVersion();
          String build = await getBuildNumber();
          showToast('version:$version build:$build');
        },
      ),
      ListTile(
        title: Text(TextKey.sheBeiXinXi.tr),
        onTap: () async {
          var infos = await getDeviceInfo();
          log(infos.toString());
          String deviceName = await getDeviceModel() ?? 'unknown';
          String version = '';
          if (Platform.isAndroid) {
            int? code = await getAndroidSdkVersion();
            version = code?.toString() ?? 'unknown';
          }
          if (Platform.isIOS) {
            version = await getIosSystemVersion() ?? 'unknown';
          }
          showToast('$deviceName $version');
        },
      ),
      ListTile(
        title: Text(TextKey.queRenWangLuoLianJie.tr),
        onTap: () async {
          if (await isNetworkAvailable()) {
            showSuccessToast('Available');
          } else {
            showErrorToast('Unavailable');
          }
        },
      ),
      ListTile(
        title: Text(TextKey.daKaiWangYe.tr),
        onTap: () async {
          openWebPage('https://www.baidu.com', mode: LaunchMode.inAppWebView);
        },
      ),
      ListTile(
        title: Text(TextKey.boDaDianHua.tr),
        onTap: () async {
          callPhone('13888888888');
        },
      ),
      ListTile(
        title: Text(TextKey.xianShiLoading.tr),
        onTap: () async {
          showLoading('Loading...');
          delayed(3000, () {
            dismissLoading();
          });
        },
      ),
      ListTile(
        title: Text(TextKey.xianShiError.tr),
        onTap: () async {
          showError('ERROR 500');
        },
      ),
      ListTile(
        title: Text(TextKey.qingChuTuPianHuanCun.tr),
        onTap: () async {
          if (await clearDiskCachedImages()) {
            showSuccessToast('Success');
          } else {
            showErrorToast('Error');
          }
        },
      ),
    ]
        .toListView(
          separator: const DividerX(),
        )
        .scrollbar()
        .safeArea();
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        DialogX.to.showNoticeDialog(
          title: '关于 Getx Scaffold',
          content: _buildDialogContent(),
          confirmText: '关闭',
        );
      },
      child: const Icon(Icons.info),
    ).padding(all: 20.w);
  }

  Widget _buildDialogContent() {
    return RichTextX(children: [
      TextSpanItem('GetXScaffold',
          onTap: () =>
              openWebPage('https://github.com/Kxmrg/flutter_getx_scaffold')),
      TextSpanItem('快速开发脚手架在'),
      TextSpanItem('GetX',
          onTap: () => openWebPage('https://github.com/jonataslaw/getx')),
      TextSpanItem(
          '框架和一些常用插件的基础上，构建了一套完整的快速开发模板。其中包括新增了部分常用功能的全局方法、常用的扩展方法和各种工具类、部分常用组件的封装、简单易用的对话框、二次封装的'),
      TextSpanItem('Dio',
          onTap: () => openWebPage('https://github.com/cfug/dio')),
      TextSpanItem(
          '网络请求工具、二次封装的GetxController、二次封装的应用主题和国际化实现等。GetXScaffold是对以上这些内容的'),
      TextSpanItem('过度封装', textColor: ThemeColor.error),
      TextSpanItem(
          '，包括一些组件的扩展方法会违背Flutter本身的开发规范，改变你的开发习惯。所以本脚手架单纯为了提高开发效率，减少重复代码，减少开发成本。如果您是刚接触 Flutter 开发并还处在学习过程中的话，并不推荐您使用该脚手架。建议您通过本示例项目或者源码了解全部使用方法。'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'home',
      builder: (_) {
        return DoublePressBackWidget(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("GetxScaffold"),
              centerTitle: true,
              elevation: 1,
            ),
            floatingActionButton: _buildFloatingActionButton(),
            body: _buildView(),
          ),
        );
      },
    );
  }
}
