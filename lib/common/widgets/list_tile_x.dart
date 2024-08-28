import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

class ListTileX extends StatelessWidget {
  final String? icon;

  final String? title;

  final Color? titleColor;

  final FontWeight? titleWeight;

  final Widget? titleWidget;

  final String? subTitle;

  final Widget? trailing;

  final bool showTrailing;

  final Function()? onTap;

  final Function()? onLongPress;

  final Color? backgroundColor;

  const ListTileX({
    super.key,
    this.icon,
    this.title,
    this.titleColor,
    this.titleWeight,
    this.titleWidget,
    this.subTitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.showTrailing = true,
    this.backgroundColor,
  });

  Widget _buildTitle() {
    if (titleWidget != null) {
      return titleWidget!;
    }
    return <Widget>[
      TextX.labelLarge(
        title ?? '',
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.fade,
        color: titleColor,
        weight: titleWeight,
      ).constrained(maxWidth: 0.65.sw),
    ].toRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }

  Widget _buildSubTitle() {
    return TextX.bodySmall(subTitle ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;
    if (icon != null) {
      iconWidget = IconX.svg(
        icon,
        size: 22.sp,
      ).padding(right: 12.w);
    }
    return <Widget>[
      if (iconWidget != null) iconWidget,
      <Widget>[
        _buildTitle(),
        if (subTitle != null) _buildSubTitle().padding(top: 3.h),
      ]
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(vertical: 18.h, right: 10.w)
          .expand(),
      trailing ??
          (showTrailing
                  ? IconX.icon(
                      Icons.keyboard_arrow_right,
                      color: ThemeColor.onSurfaceVariant,
                      size: 18.sp,
                    )
                  : Container())
              .alignCenterRight(),
    ]
        .toRow()
        .padding(
          left: 15.h,
          right: 5.h,
        )
        .inkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!();
        }
      },
    ).backgroundColor(backgroundColor ?? ThemeColor.surface);
  }
}
