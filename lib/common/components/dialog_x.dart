import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-11
 * @description: 
 */

/// 弹窗图标
enum DialogIcon {
  error,
  info,
  question,
  success,
  time,
  warn,
}

class DialogMenuItem {
  final String title;
  final String? subTitle;
  final IconData? icon;
  final Function? onTap;

  DialogMenuItem({
    required this.title,
    this.subTitle,
    this.icon,
    this.onTap,
  });
}

class DialogX {
  DialogX._();

  static DialogX get to => DialogX._();

  // 显示确认弹窗
  void showConfirmDialog({
    DialogIcon? icon,
    String? title,
    String? message,
    Widget? content,
    String confirmText = '确认',
    String cancelText = '取消',
    String? moreButtonText,
    Function? onConfirm,
    Function? onCancel,
    Function? onMore,
    bool barrierDismissible = false,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
    double? width,
  }) {
    Get.dialog(
      _buildDialog(
        icon: icon,
        title: title,
        message: message,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        moreButtonText: moreButtonText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        onMore: onMore,
        width: width,
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      name: name,
      routeSettings: routeSettings,
    );
  }

  // 显示通知弹窗
  void showNoticeDialog({
    DialogIcon? icon,
    String? title,
    String? message,
    Widget? content,
    String confirmText = '确认',
    Function? onConfirm,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
    double? width,
  }) {
    Get.dialog(
      _buildDialog(
        icon: icon,
        title: title,
        message: message,
        content: content,
        confirmText: confirmText,
        onConfirm: onConfirm,
        width: width,
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      name: name,
      routeSettings: routeSettings,
    );
  }

  // 显示提示弹窗
  void showPromptDialog({
    DialogIcon? icon = DialogIcon.warn,
    String? title,
    String? message,
    Widget? content,
    String confirmText = '确认',
    String? cancelText = '取消',
    Function? onConfirm,
    Function? onCancel,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    GlobalKey<NavigatorState>? navigatorKey,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
    double? width,
  }) {
    Get.dialog(
      _buildPromptDialog(
        icon: icon,
        title: title,
        message: message,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        width: width,
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      name: name,
      routeSettings: routeSettings,
    );
  }

  Widget _buildDialog({
    DialogIcon? icon,
    String? title,
    String? message,
    Widget? content,
    required String confirmText,
    String? cancelText,
    String? moreButtonText,
    Function? onConfirm,
    Function? onCancel,
    Function? onMore,
    double? width,
  }) {
    return <Widget>[
      if (icon != null) _buildIcon(icon).padding(bottom: 16.h),
      if (title.isNotEmptyOrNull) TextX.titleSmall(title!).padding(bottom: 16.h),
      if (message.isNotEmptyOrNull) TextX.bodyMedium(message!).padding(bottom: 16.h),
      if (message.isEmptyOrNull && content != null) content.padding(bottom: 16.h),
      <Widget>[
        ButtonX.text(
          confirmText,
          textWeight: FontWeight.bold,
          minSize: Size(65.w, 0),
          onPressed: () {
            onConfirm?.call();
            Get.back();
          },
        ),
        if (cancelText.isNotEmptyOrNull)
          ButtonX.text(
            cancelText ?? '',
            minSize: Size(65.w, 0),
            onPressed: () {
              onCancel?.call();
              Get.back();
            },
          ),
        if (moreButtonText.isNotEmptyOrNull)
          ButtonX.text(
            moreButtonText ?? '',
            minSize: Size(65.w, 0),
            onPressed: () {
              onMore?.call();
              Get.back();
            },
          ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      )
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(all: 20.w, top: 30.w)
        .card()
        .width(width ?? 0.75.sw)
        .center();
  }

  Widget _buildPromptDialog({
    DialogIcon? icon,
    String? title,
    String? message,
    Widget? content,
    required String confirmText,
    String? cancelText,
    Function? onConfirm,
    Function? onCancel,
    double? width,
  }) {
    return <Widget>[
      if (icon != null) _buildIcon(icon).padding(bottom: 8.h),
      if (title.isNotEmptyOrNull) TextX.titleSmall(title!).padding(bottom: 8.h),
      if (message.isNotEmptyOrNull)
        TextX.bodyMedium(
          message!,
          maxLines: 5,
          softWrap: true,
        ).padding(bottom: 8.h),
      if (message.isEmptyOrNull && content != null) content.padding(bottom: 8.h),
      <Widget>[
        ButtonX.primary(
          confirmText,
          textWeight: FontWeight.bold,
          onPressed: () {
            onConfirm?.call();
            Get.back();
          },
        ).width(double.infinity),
        if (cancelText.isNotEmptyOrNull)
          ButtonX.text(
            cancelText ?? '',
            minSize: Size(80.w, 0),
            onPressed: () {
              onCancel?.call();
              Get.back();
            },
          ).padding(top: (Platform.isAndroid || Platform.isIOS) ? 0 : 10.h),
      ].toColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
      )
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(all: 20.w, top: 30.w)
        .card()
        .width(width ?? 0.75.sw)
        .center();
  }

  static const String errorIcon = 'assets/svgs/error.svg';
  static const String infoIcon = 'assets/svgs/info.svg';
  static const String questionIcon = 'assets/svgs/question.svg';
  static const String successIcon = 'assets/svgs/success.svg';
  static const String timeIcon = 'assets/svgs/time.svg';
  static const String warnIcon = 'assets/svgs/warn.svg';

  Widget _buildIcon(DialogIcon icon) {
    switch (icon) {
      case DialogIcon.error:
        return const IconX.svg(
          errorIcon,
          color: Colors.red,
          package: pluginPackageName,
        );
      case DialogIcon.info:
        return const IconX.svg(
          infoIcon,
          color: Colors.blue,
          package: pluginPackageName,
        );
      case DialogIcon.question:
        return const IconX.svg(
          questionIcon,
          color: Colors.deepOrange,
          package: pluginPackageName,
        );
      case DialogIcon.success:
        return const IconX.svg(
          successIcon,
          color: Colors.green,
          package: pluginPackageName,
        );
      case DialogIcon.time:
        return const IconX.svg(
          timeIcon,
          color: Colors.deepPurple,
          package: pluginPackageName,
        );
      case DialogIcon.warn:
        return const IconX.svg(
          warnIcon,
          color: Colors.orange,
          package: pluginPackageName,
        );
    }
  }

  void showMenuDialog({
    String? title,
    required List<DialogMenuItem> menus,
  }) {
    if (menus.isEmpty) {
      return;
    }
    List<Widget> ws = [];
    if (title.isNotEmptyOrNull) {
      ws.add(TextX.labelMedium(title!).padding(vertical: 15.h));
    }
    for (var element in menus) {
      ws.add(
        ListTile(
          leading: element.icon != null
              ? IconX.icon(
                  element.icon,
                  size: 16.sp,
                )
              : null,
          horizontalTitleGap: 5.w,
          title: TextX.bodyMedium(element.title),
          subtitle: element.subTitle != null ? TextX.bodySmall(element.subTitle!) : null,
        ).inkWell(
          onTap: () => element.onTap?.call(),
        ),
      );
    }
    Widget child = ws
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          separator: const DividerX(),
        )
        .padding(bottom: 30.h)
        .scrollable()
        .constrained(
          maxHeight: 0.8.sh,
          minHeight: 0.2.sh,
        );

    showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (context) => child,
    );
  }

  void showCaptchaDialog(
    List<String> captchaImages,
    Function(bool) onConfirm, {
    String slideBarText = '滑动拼图到正确的位置',
    double? width,
  }) {
    if (captchaImages.isEmpty) {
      return;
    }
    final random = Random();
    int randomInt = random.nextInt(captchaImages.length);
    String image = captchaImages[randomInt];
    Get.dialog(
      _buildCaptchaView(
        image,
        width,
        slideBarText,
        onConfirm,
      ),
    );
  }

  Widget _buildCaptchaView(
    String image,
    double? width,
    String slideBarText,
    Function(bool) callback,
  ) {
    return <Widget>[
      SliderCaptcha(
        image: Image.asset(
          image,
          fit: BoxFit.fitWidth,
        ).clipRRect(all: 4.r),
        imageToBarPadding: 15.w,
        colorBar: ThemeColor.surface,
        colorCaptChar: ThemeColor.surface,
        title: slideBarText,
        onConfirm: (value) async {
          Get.back();
          callback(value);
        },
      ),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(all: 15.w)
        .card()
        .width(width ?? 0.9.sw)
        .center();
  }
}
