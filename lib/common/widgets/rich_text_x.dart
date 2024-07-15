import 'package:flutter/gestures.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

class TextSpanItem {
  final String text;
  final double? textSize;
  final Color? textColor;
  final Function()? onTap;

  TextSpanItem(
    this.text, {
    this.onTap,
    this.textSize,
    this.textColor,
  });
}

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-04
 * @description: 
 */

/// 简易的可点击文本
class RichTextX extends StatelessWidget {
  final List<TextSpanItem> children;

  const RichTextX({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox();
    }
    List<InlineSpan> ws = <InlineSpan>[];
    for (int i = 0; i < children.length; i++) {
      ws.add(
        TextSpan(
          text: children[i].text,
          style: TextStyle(
            fontSize: children[i].textSize ?? 14.sp,
            color: children[i].onTap == null
                ? children[i].textColor ?? ThemeColor.onSurface
                : children[i].textColor ?? ThemeColor.primary,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (children[i].onTap != null) {
                children[i].onTap!();
              }
            },
        ),
      );
    }
    return RichText(
      text: TextSpan(children: ws),
    );
  }
}
