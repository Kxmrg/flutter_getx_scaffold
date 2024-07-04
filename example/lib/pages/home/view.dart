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
        onTap: () {},
      ),
      ListTile(
        title: Text(TextKey.duiHuaKuang.tr),
        onTap: () {},
      ),
      ListTile(
        title: Text(TextKey.wangLuoQingQiu.tr),
        onTap: () {},
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
          String deviceName = await getDeviceName() ?? 'unknown';
          String deviceSystemVersion =
              await getDeviceSystemVersion() ?? 'unknown';
          showToast('$deviceName $deviceSystemVersion');
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
          openWeb('https://www.baidu.com', mode: LaunchMode.inAppWebView);
        },
      ),
      ListTile(
        title: Text(TextKey.boDaDianHua.tr),
        onTap: () async {
          callPhone('13888888888');
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
