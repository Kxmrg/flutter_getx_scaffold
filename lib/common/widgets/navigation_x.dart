import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-06
 * @description: 
 */

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final bool? dot;
  final String? badge;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.dot,
    this.badge,
  });
}

/// 导航栏
class NavigationX extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const NavigationX({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      Color color =
          (i == currentIndex) ? ThemeColor.primary : ThemeColor.onSurface;
      var weight = (i == currentIndex) ? FontWeight.bold : FontWeight.normal;
      var item = items[i];
      widgets.add(
        ElevatedButton(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              overlayColor: WidgetStateProperty.all<Color>(
                ThemeColor.primary.withOpacity(0.05),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.r)),
                ),
              )),
          child: <Widget>[
            IconX.icon(
              i == currentIndex ? item.selectedIcon ?? item.icon : item.icon,
              size: 22.sp,
              color: color,
              dot: item.dot,
              badge: item.badge,
            ),
            TextX.labelSmall(
              item.label,
              color: color,
              weight: weight,
            ).padding(top: 1.h),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          ),
          onPressed: () {
            onTap(i);
          },
        ).expand(),
      );
    }
    return BottomAppBar(
      height: 68.h,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: widgets.toRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
