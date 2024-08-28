import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:badges/badges.dart' as badges;

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-05
 * @description: 
 */

/// 图标类型
enum IconType {
  icon,
  svg,
  image,
}

/// 图标组件
class IconX extends StatelessWidget {
  // 默认的图标尺寸
  static final double _defaultSize = 30.sp;
  // 图标类型
  final IconType type;
  // 图标数据
  final IconData? iconData;
  // assets 路径
  final String? assetPath;
  // 尺寸
  final double? size;
  // 宽
  final double? width;
  // 高
  final double? height;
  // 颜色
  final Color? color;
  // 是否小圆点
  final bool? dot;
  // Badge 文字
  final String? badge;
  // 图片 fit
  final BoxFit? fit;
  // Package
  final String? package;

  const IconX({
    super.key,
    this.type = IconType.icon,
    this.iconData,
    this.assetPath,
    this.size,
    this.width,
    this.height,
    this.color,
    this.dot,
    this.badge,
    this.fit,
    this.package,
  });

  const IconX.icon(
    this.iconData, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.dot,
    this.badge,
    this.fit,
  })  : type = IconType.icon,
        assetPath = null,
        package = null;

  const IconX.image(
    this.assetPath, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.dot,
    this.badge,
    this.fit,
    this.package,
  })  : type = IconType.image,
        iconData = null;

  const IconX.svg(
    this.assetPath, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.dot,
    this.badge,
    this.fit,
    this.package,
  })  : type = IconType.svg,
        iconData = null;

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    switch (type) {
      case IconType.icon:
        widget = Icon(
          iconData,
          size: size ?? _defaultSize,
          color: color,
        );
        break;
      case IconType.image:
        if (assetPath != null) {
          widget = Image.asset(
            assetPath!,
            width: width ?? size ?? _defaultSize,
            height: height ?? size ?? _defaultSize,
            color: color,
            fit: fit ?? BoxFit.contain,
            package: package,
          );
        }
        break;
      case IconType.svg:
        if (assetPath != null) {
          widget = SvgPicture.asset(
            assetPath!,
            width: width ?? size ?? _defaultSize,
            height: height ?? size ?? _defaultSize,
            fit: fit ?? BoxFit.contain,
            package: package,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            allowDrawingOutsideViewBox: true,
          );
        }
        break;
    }
    if (widget != null) {
      if (dot == true) {
        widget = badges.Badge(
          showBadge: true,
          position: badges.BadgePosition.topEnd(top: 0, end: 0),
          child: widget,
        );
      } else if (badge.isNotEmptyOrNull) {
        double horizontalPadding = 7.sp;
        if (badge!.length == 1) {
          horizontalPadding = 8.sp;
        }
        widget = badges.Badge(
          showBadge: true,
          badgeContent: TextX(
            badge ?? '',
            size: 10.sp,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
          position: badges.BadgePosition.topEnd(top: -3.sp, end: -10.sp),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            padding: EdgeInsets.symmetric(
                vertical: 2.sp, horizontal: horizontalPadding),
            borderRadius: BorderRadius.circular(7.r),
            elevation: 10,
          ),
          child: widget,
        );
      }
    }
    return widget ?? const SizedBox();
  }
}
