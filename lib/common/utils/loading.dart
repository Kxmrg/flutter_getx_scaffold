import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: Loading
 */

/// 用于全局显示隐藏Loading Widget
class Loading {
  // 初始化Loading样式
  static void init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring // 指示器类型
      ..loadingStyle = EasyLoadingStyle.custom // loading样式 自定义
      ..indicatorSize = 45.w // 指示器大小
      ..lineWidth = 2.w // 进度条宽度
      ..radius = 10.0.r // 圆角
      ..progressColor = Colors.white // 进度条颜色
      ..backgroundColor = Colors.black.withOpacity(0.7) // 背景颜色
      ..indicatorColor = Colors.white // 指示器颜色
      ..textColor = Colors.white // 文字颜色
      ..textStyle = TextStyle(fontSize: 16.sp, color: Colors.white)
      ..maskColor = Colors.black.withOpacity(0.6) // 遮罩颜色
      ..userInteractions = true // 用户交互
      ..dismissOnTap = false; // 点击关闭
  }

  // 显示
  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? '加载中...');
  }

  // 信息
  static void showInfo(String text) {
    EasyLoading.showInfo(text);
  }

  // 进度
  static void showProgress(double progress, [String? text]) {
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.showProgress(progress, status: text);
  }

  // 错误
  static void error([String? text]) {
    EasyLoading.showError(text ?? '操作失败');
  }

  // 成功
  static void success([String? text]) {
    EasyLoading.showSuccess(text ?? '操作成功');
  }

  // 关闭
  static void dismiss() {
    EasyLoading.instance.userInteractions = true; // 恢复交互操作
    EasyLoading.dismiss();
  }

  // Toast
  static void toast(String text) {
    EasyLoading.showToast(text);
  }
}
