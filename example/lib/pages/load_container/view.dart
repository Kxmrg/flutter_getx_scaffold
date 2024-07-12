import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class LoadContainerPage extends GetView<LoadContainerController> {
  const LoadContainerPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextX.titleLarge('Page contents'),
      ButtonX(
        'Show Load Error',
        onPressed: () => controller.onError(),
      ).width(double.infinity).padding(top: 30.h, horizontal: 50.w),
      ButtonX(
        'Show Load Empty',
        onPressed: () => controller.onEmpty(),
      ).width(double.infinity).padding(top: 10.h, horizontal: 50.w),
    ].toColumn(mainAxisSize: MainAxisSize.min).center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadContainerController>(
      init: LoadContainerController(),
      id: 'loadContainer',
      builder: (_) {
        return Scaffold(
          appBar:
              AppBar(title: Text(TextKey.jiZaiRongQiZuJian.tr), elevation: 1),
          body: SafeArea(
            child: LoadContainer(
              controller: controller.loadController!,
              onReLoad: controller.onLoad,
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}
