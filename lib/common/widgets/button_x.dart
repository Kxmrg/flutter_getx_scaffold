import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:badges/badges.dart' as badges;

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-10
 * @description: 
 */

/// 按钮类型
enum ButtonType {
  general, // 默认按钮
  outlined, // 边框按钮
  text, // 文字按钮
  icon, // 图标按钮
}

class ButtonX extends StatelessWidget {
  // 按钮类型
  final ButtonType type;
  // 按钮文本
  final String text;
  // 圆角
  final double? borderRadius;
  // 边框宽度
  final double? borderWidth;
  // 背景颜色
  final Color? backgroundColor;
  // 前景颜色，包括文本图标边框
  final Color? foregroundColor;
  // 内边距
  final EdgeInsetsGeometry? innerPadding;
  // 最小尺寸限制
  final Size? minSize;
  // 子组件
  final Widget? child;
  // 文本颜色
  final Color? textColor;
  // 文本大小
  final double? textSize;
  // 文本字重
  final FontWeight? textWeight;
  // 文本样式(会覆盖以上文本属性)
  final TextStyle? textStyle;
  // Icon
  final IconData? icon;
  // IconSize
  final double? iconSize;
  // 是否小圆点
  final bool? dot;
  // Badge 文字
  final String? badge;

  final Function()? onPressed;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const ButtonX(
    this.text, {
    super.key,
    this.type = ButtonType.general,
    this.borderRadius,
    this.borderWidth,
    this.backgroundColor, // 按钮背景颜色
    this.foregroundColor, // 文本及图标颜色
    this.innerPadding, // 内边距
    this.minSize, // 最小尺寸限制
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.child,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.dot,
    this.badge,
  });

  ButtonX.primary(
    this.text, {
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.innerPadding, // 内边距
    this.minSize, // 最小尺寸限制
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.child,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.dot,
    this.badge,
  })  : type = ButtonType.general,
        backgroundColor = ThemeColor.primaryContainer,
        foregroundColor = ThemeColor.onPrimaryContainer;

  const ButtonX.outline(
    this.text, {
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.backgroundColor, // 按钮背景颜色
    this.foregroundColor, // 文本及图标颜色
    this.innerPadding, // 内边距
    this.minSize, // 最小尺寸限制
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.child,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.dot,
    this.badge,
  }) : type = ButtonType.outlined;

  const ButtonX.text(
    this.text, {
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.backgroundColor, // 按钮背景颜色
    this.foregroundColor, // 文本及图标颜色
    this.innerPadding, // 内边距
    this.minSize, // 最小尺寸限制
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.dot,
    this.badge,
  })  : type = ButtonType.text,
        child = null;

  const ButtonX.icon(
    this.icon, {
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.backgroundColor, // 按钮背景颜色
    this.foregroundColor, // 文本及图标颜色
    this.innerPadding, // 内边距
    this.minSize, // 最小尺寸限制
    this.onPressed,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.child,
    this.iconSize,
    this.dot,
    this.badge,
  })  : type = ButtonType.icon,
        text = '',
        textColor = null,
        textSize = null,
        textWeight = null,
        textStyle = null,
        onLongPress = null,
        onHover = null,
        onFocusChange = null,
        clipBehavior = Clip.none;

  ButtonX.back(
    this.onPressed, {
    super.key,
  })  : type = ButtonType.icon,
        text = '',
        icon = Icons.arrow_back,
        iconSize = 24.sp,
        innerPadding = EdgeInsets.all(14.sp),
        borderRadius = 15.r,
        borderWidth = null,
        backgroundColor = null,
        foregroundColor = null,
        minSize = null,
        child = null,
        textColor = null,
        textSize = null,
        textWeight = null,
        textStyle = null,
        dot = null,
        badge = null,
        onLongPress = null,
        onHover = null,
        onFocusChange = null,
        style = null,
        focusNode = null,
        autofocus = false,
        clipBehavior = Clip.none;

  Widget _buildChild() {
    if (child != null) {
      return child!;
    } else {
      Widget widget = TextX(
        text,
        color: textColor,
        size: textSize,
        weight: textWeight,
        style: textStyle,
      );
      if (icon != null) {
        widget = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconX.icon(
              icon,
              size: iconSize ?? 14.sp,
              color: textColor,
            ),
            SizedBox(width: 5.w),
            widget,
          ],
        );
      }
      return widget;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (type) {
      case ButtonType.general:
        widget = ElevatedButton(
          style: style ??
              ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 7.r)),
                ),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                padding: innerPadding,
                minimumSize: minSize,
              ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: _buildChild(),
        );
        break;
      case ButtonType.outlined:
        widget = OutlinedButton(
          style: style ??
              OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 7.r)),
                ),
                side: BorderSide(
                  width: borderWidth ?? 1.5.w,
                  color: foregroundColor ?? ThemeColor.primary,
                ),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                padding: innerPadding,
                minimumSize: minSize,
              ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: _buildChild(),
        );
        break;
      case ButtonType.text:
        widget = TextButton(
          style: style ??
              TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 7.r)),
                ),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                padding: innerPadding,
                minimumSize: minSize,
              ),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: _buildChild(),
        );
        break;
      case ButtonType.icon:
        widget = IconButton(
          icon: child ??
              IconX.icon(
                icon,
                size: iconSize ?? 20.sp,
                color: foregroundColor ?? ThemeColor.onPrimaryContainer,
              ),
          style: style ??
              IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 7.r)),
                ),
                backgroundColor: backgroundColor ?? ThemeColor.primaryContainer,
                foregroundColor: foregroundColor,
                padding: innerPadding,
                minimumSize: minSize,
              ),
          onPressed: onPressed,
          focusNode: focusNode,
          autofocus: autofocus,
        );
        break;
    }
    if (dot == true) {
      widget = badges.Badge(
        showBadge: true,
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
        child: widget,
      );
    } else if (badge.isNotEmptyOrNull) {
      double horizontalPadding = 6.sp;
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
              vertical: 0.5.sp, horizontal: horizontalPadding),
          borderRadius: BorderRadius.circular(6.r),
          elevation: 10,
        ),
        child: widget,
      );
    }
    return widget;
  }
}
