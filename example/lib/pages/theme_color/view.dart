import 'package:example/common/langs/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class ThemeColorPage extends GetView<ThemeColorController> {
  const ThemeColorPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextX.titleSmall(
        'ThemeColor.onPrimary',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.primary),
      TextX.titleSmall(
        'ThemeColor.onPrimaryContainer',
        color: ThemeColor.onPrimaryContainer,
      ).padding(all: 10.w).backgroundColor(ThemeColor.primaryContainer),
      TextX.titleSmall(
        'ThemeColor.onSecondary',
        color: ThemeColor.onSecondary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.secondary),
      TextX.titleSmall(
        'ThemeColor.onSecondaryContainer',
        color: ThemeColor.onSecondaryContainer,
      ).padding(all: 10.w).backgroundColor(ThemeColor.secondaryContainer),
      TextX.titleSmall(
        'ThemeColor.onTertiary',
        color: ThemeColor.onTertiary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.tertiary),
      TextX.titleSmall(
        'ThemeColor.onTertiaryContainer',
        color: ThemeColor.onTertiaryContainer,
      ).padding(all: 10.w).backgroundColor(ThemeColor.tertiaryContainer),
      TextX.titleSmall(
        'ThemeColor.onError',
        color: ThemeColor.onError,
      ).padding(all: 10.w).backgroundColor(ThemeColor.error),
      TextX.titleSmall(
        'ThemeColor.onErrorContainer',
        color: ThemeColor.onErrorContainer,
      ).padding(all: 10.w).backgroundColor(ThemeColor.errorContainer),
      TextX.titleSmall(
        'ThemeColor.onSurface',
        color: ThemeColor.onSurface,
      ).padding(all: 10.w).backgroundColor(ThemeColor.surface),
      TextX.titleSmall(
        'ThemeColor.onSurfaceVariant',
        color: ThemeColor.onSurfaceVariant,
      ).padding(all: 10.w).backgroundColor(ThemeColor.surface),
      TextX.titleSmall(
        'ThemeColor.outline',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.outline),
      TextX.titleSmall(
        'ThemeColor.outlineVariant',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.outlineVariant),
      TextX.titleSmall(
        'ThemeColor.shadow',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.shadow),
      TextX.titleSmall(
        'ThemeColor.scrim',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.scrim),
      TextX.titleSmall(
        'ThemeColor.onInverseSurface',
        color: ThemeColor.onInverseSurface,
      ).padding(all: 10.w).backgroundColor(ThemeColor.inverseSurface),
      TextX.titleSmall(
        'ThemeColor.scrim',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.inversePrimary),
      TextX.titleSmall(
        'ThemeColor.surfaceTint',
        color: ThemeColor.onPrimary,
      ).padding(all: 10.w).backgroundColor(ThemeColor.surfaceTint),
    ].toListView(
      separator: const DividerX(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(
      init: ThemeColorController(),
      id: 'themeColor',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(TextKey.shiYongZhuTiSe.tr), elevation: 1),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
