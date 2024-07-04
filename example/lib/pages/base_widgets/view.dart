import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
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
      ].toWrap(spacing: 10.w).padding(all: 10.w),
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
      ]),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(all: 10.w)
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseWidgetsController>(
      init: BaseWidgetsController(),
      id: 'baseWidgets',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.jiChuZuJian.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
