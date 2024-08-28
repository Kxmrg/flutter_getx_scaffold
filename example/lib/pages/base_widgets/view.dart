import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/common/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class BaseWidgetsPage extends GetView<BaseWidgetsController> {
  const BaseWidgetsPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextX.displayLarge('DisplayLarge'),
      TextX.displayMedium('DisplayMedium'),
      TextX.displaySmall('DisplaySmall'),
      TextX.headlineLarge('HeadlineLarge'),
      TextX.headlineMedium('HeadlineMedium'),
      TextX.headlineSmall('HeadlineSmall'),
      TextX.titleLarge('TitleLarge'),
      TextX.titleMedium('TitleMedium'),
      TextX.titleSmall('TitleSmall'),
      TextX.bodyLarge('BodyLarge'),
      TextX.bodyMedium('BodyMedium'),
      TextX.bodySmall('BodySmall'),
      TextX.labelLarge('LabelLarge'),
      TextX.labelMedium('LabelMedium'),
      TextX.labelSmall('LabelSmall'),
      const TextX('Weight 100', weight: FontWeight.w100),
      const TextX('Weight 200', weight: FontWeight.w200),
      const TextX('Weight 300', weight: FontWeight.w300),
      const TextX('Weight 400', weight: FontWeight.w400),
      const TextX('Weight 500', weight: FontWeight.w500),
      const TextX('Weight 600', weight: FontWeight.w600),
      const TextX('Weight 700', weight: FontWeight.w700),
      const TextX('Weight 800', weight: FontWeight.w800),
      const TextX('Weight 900', weight: FontWeight.w900),
      //可点击文本
      RichTextX(children: [
        TextSpanItem(
          '简易',
        ),
        TextSpanItem('可点击', onTap: () {
          showInfoToast('onClick!');
        }),
        TextSpanItem(
          '文本测试',
        ),
      ]).padding(top: 10.w),
      //TextTag
      <Widget>[
        const TextTag('Text Tag'),
        const TextTag(
          'Text Tag Outline',
          outline: true,
        ),
        const TextTag(
          'Text Tag Orange',
          color: Colors.orange,
        ),
      ].toWrap(spacing: 10.w).padding(top: 10.w),
      //Button
      <Widget>[
        ButtonX(
          'Primary',
          dot: true,
          icon: Icons.info,
          onPressed: () {},
        ),
        ButtonX.secondary(
          'Secondary',
          badge: 'NEW',
          onPressed: () {},
        ),
        ButtonX.outline(
          'Outline',
          onPressed: () {},
        ),
        ButtonX.icon(
          Icons.add,
          badge: controller.number.toString(),
          onPressed: () {
            controller.increment();
          },
        ),
        ButtonX.text(
          'Text',
          onPressed: () {},
        ),
        ButtonX.text(
          'Small Text Button',
          textColor: Colors.orange,
          textSize: 12.sp,
          textWeight: FontWeight.bold,
          minSize: Size.zero,
          innerPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          borderRadius: 3.r,
          onPressed: () {},
        ),
        ButtonX.back(() {}),
      ].toWrap(spacing: 10.w).padding(top: 10.w),
      //Icon
      //Antd图标库：https://www.iconfont.cn/collections/detail?spm=a313x.collections_index.i1.d9df05512.40943a815QJHPE&cid=9402
      <Widget>[
        IconX.icon(
          AntdIcon.project,
          size: 40.sp,
          dot: controller.showDot,
        ).onTap(() {
          controller.updateDot();
        }),
        IconX.icon(
          Icons.add_circle_sharp,
          size: 40.sp,
          badge: controller.number.toString(),
        ).onTap(() {
          controller.increment();
        }),
        IconX.svg(
          'assets/svgs/icon1.svg',
          size: 40.sp,
          badge: 'New',
        ),
        IconX.image(
          'assets/icons/ic_launcher_adaptive_dark.png',
          size: 40.sp,
        ).backgroundColor(Colors.orange).clipRRect(all: 8.r),
      ].toWrap(spacing: 10.w).padding(top: 10.w),
      //SpinKit
      //https://pub-web.flutter-io.cn/packages/flutter_spinkit
      <Widget>[
        SpinKitFoldingCube(
          color: ThemeColor.primaryContainer,
          size: 22.sp,
        ).padding(all: 10.w),
        20.w.spacing(),
        SpinKitDoubleBounce(
          color: ThemeColor.primaryContainer,
          size: 30.sp,
        ).padding(all: 10.w),
        20.w.spacing(),
        SpinKitFadingCircle(
          color: ThemeColor.primaryContainer,
          size: 30.sp,
        ).padding(all: 10.w),
        20.w.spacing(),
        SpinKitRipple(
          color: ThemeColor.primaryContainer,
          size: 30.sp,
        ).padding(all: 10.w),
      ].toRow().padding(top: 20.w),
      //lottie
      //https://pub-web.flutter-io.cn/packages/lottie
      Lottie.asset(
        'assets/lottie/error.json',
        package: pluginPackageName,
        width: 0.7.sw,
      ).card().padding(top: 10.w),
      //image
      ImageX.url(
        'https://i0.hdslb.com/bfs/archive/ac72ae36271a6970f92b1de485e6ae6c9e4c1ebb.jpg',
        width: 0.7.sw,
        radius: 5.r,
      ).padding(top: 10.w),
    ]
        .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
        .padding(all: 10.w, bottom: 50.w)
        .scrollable(primary: true)
        .scrollbar()
        .width(1.sw);
  }

  //导航栏
  Widget _buildNavigationBar() {
    return NavigationX(
      currentIndex: controller.pageIndex, // 当前选中的tab索引
      onTap: (index) {
        controller.pageIndex = index;
        controller.updateUi();
      }, // 切换tab事件
      items: [
        NavigationItemModel(
          label: '首页',
          icon: AntdIcon.home,
          selectedIcon: AntdIcon.home_fill,
          dot: true,
        ),
        NavigationItemModel(
          label: '日历',
          icon: AntdIcon.calendar,
          selectedIcon: AntdIcon.calendar_fill,
          badge: '18',
        ),
        NavigationItemModel(
          label: '设置',
          icon: AntdIcon.setting,
          selectedIcon: AntdIcon.setting_fill,
        ),
        NavigationItemModel(
          label: '设置',
          icon: AntdIcon.setting,
          selectedIcon: AntdIcon.setting_fill,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseWidgetsController>(
      init: BaseWidgetsController(),
      id: 'baseWidgets',
      builder: (_) {
        return Scaffold(
          extendBody: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: Text(TextKey.jiChuZuJian.tr), elevation: 1),
          bottomNavigationBar: _buildNavigationBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
