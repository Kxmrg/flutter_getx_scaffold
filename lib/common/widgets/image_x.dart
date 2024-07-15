import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-10
 * @description: 
 */

/// 图片类型
enum ImageType { asset, network, file }

/// 图片组件
class ImageX extends StatelessWidget {
  // 类型
  final ImageType type;
  // 图片资源
  final String image;
  // 圆角
  final double? radius;
  // 宽度
  final double? width;
  // 高度
  final double? height;
  // 剪裁方式
  final BoxFit? fit;
  // 占位图
  final Widget? placeholder;
  // 背景颜色
  final Color? backgroundColor;
  // Package
  final String? package;

  // builder 函数
  final Widget Function(
    BuildContext context,
    ImageProvider provider,
    Widget completed,
    Size? size,
  )? builder;

  const ImageX({
    super.key,
    required this.type,
    required this.image,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
    this.package,
  });

  const ImageX.url(
    this.image, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageType.network,
        package = null;

  const ImageX.asset(
    this.image, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
    this.package,
  }) : type = ImageType.asset;

  const ImageX.file(
    this.image, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageType.file,
        package = null;

  Widget get _placeholder =>
      placeholder ??
      Center(
        child: IconX.icon(
          Icons.bolt,
          size: 20.sp,
          color: ThemeColor.onSurface,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(
      Radius.circular(radius ?? 0),
    );
    Widget? imageWidget;
    switch (type) {
      case ImageType.asset:
        imageWidget = ExtendedImage.asset(
          image,
          package: package,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageType.network:
        if (!image.contains('http')) break;
        imageWidget = ExtendedImage.network(
          image,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageType.file:
        imageWidget = ExtendedImage.file(
          File(image),
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
    }

    Widget widget = Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: imageWidget ?? _placeholder,
    );
    return widget;
  }

  Widget _buildLoadState(BuildContext context, ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      // 正在读取
      case LoadState.loading:
        return _placeholder;
      // 读取成功
      case LoadState.completed:
        Size? size;
        if (state.extendedImageInfo != null) {
          size = Size(
            state.extendedImageInfo!.image.width.toDouble(),
            state.extendedImageInfo!.image.height.toDouble(),
          );
        }
        final provider = state.imageProvider;
        final completed = state.completedWidget;
        return builder?.call(context, provider, completed, size) ?? completed;
      // 读取失败
      case LoadState.failed:
        return Center(
          child: IconX.icon(
            Icons.close,
            size: 20.sp,
            color: ThemeColor.onSurface,
          ),
        );
    }
  }
}
