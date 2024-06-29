import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      const Text('test').onTap(() {
        Loading.show();
        delayed(const Duration(seconds: 2), () {
          Loading.dismiss();
        });
      }),
    ].toColumn().scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("GetxScaffold")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
