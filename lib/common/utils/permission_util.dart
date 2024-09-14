import 'dart:async';
import 'dart:io';

import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-18
 * @description: 
 */

/// 动态授权工具
class PermissionUtil {
  /// 申请权限
  static Future<bool> request({
    required Permission permission,
    String? title,
    String? confirmText,
    required String message,
    required String error,
    double? width,
  }) async {
    if (await permission.isGranted) {
      return true;
    }
    Completer<bool> completer = Completer<bool>();
    DialogX.to.showPromptDialog(
      icon: DialogIcon.warn,
      title: title ?? '授权确认',
      message: message,
      barrierDismissible: false,
      confirmText: confirmText ?? '确认授权',
      width: width,
      onConfirm: () async {
        var status = await permission.request();
        if (status.isGranted) {
          completer.complete(true);
        } else {
          completer.complete(false);
        }
      },
      onCancel: () {
        completer.complete(false);
      },
    );

    if (await completer.future) {
      return true;
    } else {
      showError(error);
      return false;
    }
  }

  /// 相机权限
  static Future<bool> camera({double? width}) async {
    return await request(
      permission: Permission.camera,
      message: '我们申请使用您设备的相机权限，用于扫描二维码或者采集必要的身份信息',
      error: '请授权相机权限',
      width: width,
    );
  }

  /// 相册权限
  static Future<bool> photos({double? width}) async {
    String message = '我们申请使用您设备的相册权限，用于读写您相册中的照片';
    String error = '请授权相册权限';
    if (Platform.isAndroid) {
      int version = await getAndroidSdkVersion() ?? 0;
      if (version < 33) {
        return await request(
          permission: Permission.storage,
          message: message,
          error: error,
          width: width,
        );
      }
    }
    return await request(
      permission: Permission.photos,
      message: message,
      error: error,
      width: width,
    );
  }

  /// 蓝牙权限
  static Future<bool> bluetooth({double? width}) async {
    String message = '我们申请使用您设备的蓝牙功能，用于发现和链接蓝牙设备';
    String error = '请授权蓝牙权限';
    if (Platform.isAndroid) {
      int version = await getAndroidSdkVersion() ?? 0;
      if (version < 31) {
        return await request(
          permission: Permission.bluetooth,
          message: message,
          error: error,
          width: width,
        );
      }
    }
    return await request(
      permission: Permission.bluetoothConnect,
      message: message,
      error: error,
      width: width,
    );
  }

  /// 打开系统设置
  static Future<bool> openSettings() async {
    return await openAppSettings();
  }
}
