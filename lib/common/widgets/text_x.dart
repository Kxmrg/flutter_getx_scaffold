import 'package:flutter/material.dart';
import 'package:getx_scaffold/common/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-04
 * @description: 
 */

/// 文本组件
class TextX extends StatelessWidget {
  // 文本
  final String text;
  // 样式
  final TextStyle? style;
  // 颜色
  final Color? color;
  // 大小
  final double? size;
  // 重量
  final FontWeight? weight;
  // 行高
  final double? height;
  // 最大行数
  final int? maxLines;
  // 自动换行
  final bool? softWrap;
  // 溢出文本处理
  final TextOverflow? overflow;
  // 对齐方式
  final TextAlign? textAlign;

  const TextX(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.size,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  });

  TextX.displayLarge(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.displayLarge,
        size = 50.sp;

  TextX.displayMedium(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.displayMedium,
        size = 40.sp;

  TextX.displaySmall(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.displaySmall,
        size = 30.sp;

  TextX.headlineLarge(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.headlineLarge,
        size = 26.sp;

  TextX.headlineMedium(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.headlineMedium,
        size = 26.sp;

  TextX.headlineSmall(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.headlineSmall,
        size = 24.sp;

  TextX.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.titleLarge,
        size = 22.sp;

  TextX.titleMedium(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.titleMedium,
        size = 20.sp;

  TextX.titleSmall(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.titleSmall,
        size = 18.sp;

  TextX.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.bodyLarge,
        size = 16.sp;

  TextX.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.bodyMedium,
        size = 14.sp;

  TextX.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.bodySmall,
        size = 12.sp;

  TextX.labelLarge(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.labelLarge,
        size = 16.sp;

  TextX.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.labelMedium,
        size = 14.sp;

  TextX.labelSmall(
    this.text, {
    super.key,
    this.color,
    this.weight,
    this.height,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
  })  : style = Theme.of(Get.context!).textTheme.labelSmall,
        size = 12.sp;

  @override
  Widget build(BuildContext context) {
    if (text == '') {
      return const SizedBox();
    }
    Widget widget = Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: size ?? 14.sp,
            fontWeight: weight,
            height: height,
          ) ??
          TextStyle(
            color: color,
            fontSize: size ?? 14.sp,
            fontWeight: weight,
            height: height,
          ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign ?? TextAlign.left,
    );
    return widget;
  }
}
