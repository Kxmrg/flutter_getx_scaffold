import 'package:example/common/langs/index.dart';
import 'package:example/common/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class NetworkPage extends GetView<NetworkController> {
  const NetworkPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text('设置BaseURL'),
        onTap: () {
          HttpService.to.setBaseUrl('https://api.vvhan.com');
        },
      ),
      ListTile(
        title: const Text('设置Authorization'),
        onTap: () {
          HttpService.to.setAuthorization('1234567890');
        },
      ),
      ListTile(
        title: const Text('清除Authorization'),
        onTap: () {
          HttpService.to.clearAuthorization();
        },
      ),
      ListTile(
        title: const Text('设置响应统一处理'),
        onTap: () {
          HttpService.to.setOnResponseHandler(
            (response) async {
              try {
                var result = BaseModel.fromJson(response.data);
                if (result.success == true) {
                  return null;
                } else {
                  return '服务器异常';
                }
              } on Exception catch (e) {
                e.printInfo();
                return '服务器异常';
              }
            },
          );
        },
      ),
      ListTile(
        title: const Text('取消统一处理'),
        onTap: () {
          HttpService.to.setOnResponseHandler(null);
        },
      ),
      ListTile(
        title: const Text('请求接口'),
        onTap: () async {
          showLoading();
          var response = await HttpService.to.get(
            '/api/wallpaper/acg?type=json',
          );
          if (response != null) {
            dismissLoading();
            var result = BaseModel.fromJson(response.data);
            showToast(result.url ?? '');
          }
        },
      ),
      ListTile(
        title: const Text('取消网络请求'),
        onTap: () async {
          Loading.show();
          controller.cancelToken = CancelToken();
          HttpService.to
              .get(
            '/api/wallpaper/acg?type=json',
            cancelToken: controller.cancelToken,
          )
              .then((value) {
            Loading.dismiss();
          });
          delayed(200, () => HttpService.to.cancel(controller.cancelToken));
        },
      ),
      ListTile(
        title: const Text('取消全部网络请求'),
        onTap: () async {
          HttpService.to.cancel();
        },
      ),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NetworkController>(
      init: NetworkController(),
      id: 'network',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.wangLuoQingQiu.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
