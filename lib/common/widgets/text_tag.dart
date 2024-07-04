import 'package:flutter/material.dart';
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

/// 文本标签
class TextTag extends StatelessWidget {
  final String text;
  final Color? color;
  final bool outline;

  const TextTag(
    this.text, {
    super.key,
    this.color,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    if (outline) {
      return TextX.labelSmall(
        text,
        color: color ?? Theme.of(Get.context!).colorScheme.primary,
      )
          .padding(
            horizontal: 10.w,
            vertical: 3.h,
          )
          .border(
            radius: 5.r,
            color: color ?? Theme.of(Get.context!).colorScheme.primary,
            all: 1.4,
          );
    } else {
      return TextX.labelSmall(
        text,
        color: Theme.of(Get.context!).colorScheme.onPrimary,
      )
          .padding(
            horizontal: 10.w,
            vertical: 3.h,
          )
          .border(
            radius: 5.r,
            backgroundColor:
                color ?? Theme.of(Get.context!).colorScheme.primary,
          );
    }
  }
}
