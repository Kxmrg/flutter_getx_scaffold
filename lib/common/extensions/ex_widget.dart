import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 
 */

/// 手势回调
typedef GestureOnTapChangeCallback = void Function<T>(T val);

/// 扩展Widget
extension ExWidget on Widget {
  /// 控制组件隐藏显示
  Widget visibility({
    Key? key,
    required bool visible,
    bool maintainSize = false,
    bool maintainState = false,
    bool maintainAnimation = false,
  }) =>
      Visibility(
        key: key,
        visible: visible,
        maintainSize: maintainSize,
        maintainState: maintainState,
        maintainAnimation: maintainAnimation,
        child: this,
      );

  /// 比例布局
  Widget aspectRatio({
    Key? key,
    required double aspectRatio,
  }) =>
      AspectRatio(
        key: key,
        aspectRatio: aspectRatio,
        child: this,
      );

  /// 卡片布局
  Widget card({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation = 5,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior = Clip.antiAlias,
    bool semanticContainer = true,
  }) =>
      Card(
        key: key,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: this,
      );

  /// 居中布局
  Widget center({
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// 裁剪圆形
  Widget clipOval({Key? key}) => ClipOval(
        key: key,
        child: this,
      );

  /// 裁剪矩形
  Widget clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ClipRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// 裁剪圆角
  Widget clipRRect({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
        child: this,
      );

  /// 阴影
  Widget elevation(
    double elevation, {
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        child: this,
      );

  /// expand 撑满
  Widget expand({
    Key? key,
    int flex = 1,
  }) =>
      Expanded(
        key: key,
        flex: flex,
        child: this,
      );

  /// 缩放布局
  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.centerLeft,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
        key: key,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// 弹性布局
  Widget flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(
        key: key,
        flex: flex,
        fit: fit,
        child: this,
      );

  /// 百分比布局
  Widget fractionallySizedBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      FractionallySizedBox(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// 限制盒子 最大宽高
  Widget limitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) =>
      LimitedBox(
        key: key,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: this,
      );

  /// 隐藏但正常构建
  Widget offstage({
    Key? key,
    bool offstage = true,
  }) =>
      Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  /// 透明度
  Widget opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this,
      );

  /// 溢出
  Widget overflow({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      OverflowBox(
        key: key,
        alignment: alignment,
        minWidth: minWidth,
        maxWidth: minWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: this,
      );

  /// Stack布局 位置
  Widget positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  /// 墨水纹
  Widget inkWell({
    Key? key,
    Color? color,
    double? borderRadius,
    Function()? onTap,
    Function()? onLongPress,
  }) =>
      Material(
        color: color ?? Colors.transparent,
        child: Ink(
          child: InkWell(
            borderRadius: borderRadius != null
                ? BorderRadius.all(
                    Radius.circular(borderRadius),
                  )
                : null,
            onTap: onTap ?? () {},
            onLongPress: onLongPress ?? () {},
            child: this,
          ),
        ),
      );

  /// 涟漪
  Widget ripple({
    Key? key,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    bool autoFocus = false,
    bool enable = true,
  }) =>
      enable
          ? Builder(
              key: key,
              builder: (BuildContext context) {
                GestureDetector? gestures =
                    context.findAncestorWidgetOfExactType<GestureDetector>();
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: focusColor,
                    hoverColor: hoverColor,
                    highlightColor: highlightColor,
                    splashColor: splashColor,
                    splashFactory: splashFactory,
                    radius: radius,
                    customBorder: customBorder,
                    enableFeedback: enableFeedback,
                    excludeFromSemantics: excludeFromSemantics,
                    focusNode: focusNode,
                    canRequestFocus: canRequestFocus,
                    autofocus: autoFocus,
                    onTap: gestures?.onTap,
                    child: this,
                  ),
                );
              },
            )
          : Builder(
              key: key,
              builder: (context) => this,
            );

  /// 比例缩放
  Widget scale({
    Key? key,
    double? all,
    double? x,
    double? y,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: Matrix4.diagonal3Values(x ?? all ?? 0, y ?? all ?? 0, 1.0),
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// 滚动视图
  Widget scrollable({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics = const ClampingScrollPhysics(),
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    EdgeInsetsGeometry? padding,
  }) =>
      SingleChildScrollView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        padding: padding,
        child: this,
      );

  /// 滚动条
  Widget scrollbar({
    Key? key,
    ScrollController? controller,
    bool? thumbVisibility,
    bool? trackVisibility,
    double? thickness,
    Radius? radius,
    bool Function(ScrollNotification)? notificationPredicate,
    bool? interactive,
    ScrollbarOrientation? scrollbarOrientation,
  }) =>
      Scrollbar(
        key: key,
        controller: controller,
        thumbVisibility: thumbVisibility,
        trackVisibility: trackVisibility,
        thickness: thickness,
        radius: radius,
        notificationPredicate: notificationPredicate,
        interactive: interactive,
        scrollbarOrientation: scrollbarOrientation,
        child: this,
      );

  /// Transforms Matrix4
  Widget transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: transform,
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// Translate 变化位置
  Widget translate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
  }) =>
      Transform.translate(
        key: key,
        offset: offset,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// 约束
  Widget constrained({
    Key? key,
    double? width,
    double? height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null)
        ? constraints.tighten(width: width, height: height)
        : constraints;
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }

  /// 约束宽高
  Widget tight({
    double? width,
    double? height,
    double? size,
    Key? key,
  }) =>
      constrained(
        key: key,
        width: size ?? width,
        height: size ?? height,
      );

  /// 约束宽度
  Widget width(
    double width, {
    Key? key,
  }) =>
      constrained(
        key: key,
        width: width,
      );

  /// 约束高度
  Widget height(
    double height, {
    Key? key,
  }) =>
      constrained(
        key: key,
        height: height,
      );

  /// 取消父级约束
  Widget unConstrained({
    Key? key,
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    Axis? constrainedAxis,
    Clip clipBehavior = Clip.none,
  }) =>
      UnconstrainedBox(
        key: key,
        textDirection: textDirection,
        alignment: alignment,
        constrainedAxis: constrainedAxis,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// 安全区域
  Widget safeArea({
    Key? key,
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) =>
      SafeArea(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );

  /// 对齐
  Widget align(
    AlignmentGeometry alignment, {
    Key? key,
  }) =>
      Align(
        key: key,
        alignment: alignment,
        child: this,
      );

  /// 对齐 上左边
  Widget alignTopLeft() => align(Alignment.topLeft);

  /// 对齐 顶部居中
  Widget alignTopCenter() => align(Alignment.topCenter);

  /// 对齐 上右边
  Widget alignTopRight() => align(Alignment.topRight);

  /// 对齐 左边
  Widget alignCenterLeft() => align(Alignment.centerLeft);

  /// 对齐 中间
  Widget alignCenter() => align(Alignment.center);

  /// 对齐 右边
  Widget alignCenterRight() => align(Alignment.centerRight);

  /// 对齐 下左边
  Widget alignBottomLeft() => align(Alignment.bottomLeft);

  /// 对齐 底部
  Widget alignBottomCenter() => align(Alignment.bottomCenter);

  /// 对齐 下右边
  Widget alignBottomRight() => align(Alignment.bottomRight);

  /// 盒子装饰器
  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
  }) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  /// 背景颜色
  Widget backgroundColor(
    Color color, {
    Key? key,
  }) =>
      decorated(
        key: key,
        color: color,
      );

  /// 背景图片
  Widget backgroundImage(
    DecorationImage image, {
    Key? key,
  }) =>
      decorated(
        key: key,
        image: image,
      );

  /// 边框
  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? radius,
    Color? backgroundColor,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
  }) {
    Border border = Border(
      left: (left ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: left ?? all ?? 0, style: style),
      right: (right ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: right ?? all ?? 0, style: style),
      top: (top ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: top ?? all ?? 0, style: style),
      bottom: (bottom ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
    );
    BorderRadius borderRadius = BorderRadius.all(Radius.circular(radius ?? 0));
    return decorated(
      color: backgroundColor,
      key: key,
      border: border,
      borderRadius: borderRadius,
    );
  }

  /// 阴影
  Widget boxShadow({
    Key? key,
    Color color = Colors.black,
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    BlurStyle blurStyle = BlurStyle.normal,
  }) {
    List<BoxShadow> boxShadow = [
      BoxShadow(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        blurStyle: blurStyle,
      ),
    ];
    return decorated(
      key: key,
      boxShadow: boxShadow,
    );
  }

  /// 手势
  Widget gestures({
    Key? key,
    GestureOnTapChangeCallback? onTapChange,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: () {
          if (onTap != null) onTap();
          if (onTapChange != null) onTapChange(false);
        },
        onTapUp: onTapUp,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragCancel: onVerticalDragCancel,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragDown: onHorizontalDragDown,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onScaleStart: onScaleStart,
        onScaleEnd: onScaleEnd,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  /// 点击
  Widget onTap(
    GestureTapCallback? onTap, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      gestures(
        key: key,
        onTap: onTap,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
      );

  /// 长按
  Widget onLongPress(
    GestureTapCallback? onLongPress, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      gestures(
        key: key,
        onLongPress: onLongPress,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
      );

  /// 内间距
  Widget padding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        child: this,
      );

  /// Sliver 内间距
  Widget sliverPadding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      SliverPadding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        sliver: this,
      );

  /// 内间距 纵向
  Widget sliverPaddingVertical(double val) => sliverPadding(vertical: val);

  /// 内间距 横向
  Widget sliverPaddingHorizontal(double val) => sliverPadding(horizontal: val);

  /// 内间距 上
  Widget sliverPaddingTop(double val) => sliverPadding(top: val);

  /// 内间距 下
  Widget sliverPaddingBottom(double val) => sliverPadding(bottom: val);

  /// 内间距 左
  Widget sliverPaddingLeft(double val) => sliverPadding(left: val);

  /// 内间距 右
  Widget sliverPaddingRight(double val) => sliverPadding(right: val);

  /// SliverToBoxAdapter
  Widget sliver({
    Key? key,
  }) =>
      SliverToBoxAdapter(key: key, child: this);

  Widget tooltip({
    Key? key,
    String? message,
    InlineSpan? richMessage,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? verticalOffset,
    bool? preferBelow,
    bool? excludeFromSemantics,
    Decoration? decoration,
    TextStyle? textStyle,
    TextAlign? textAlign,
    Duration? waitDuration,
    Duration? showDuration,
    Duration? exitDuration,
    bool? enableTapToDismiss,
    TooltipTriggerMode? triggerMode,
    bool? enableFeedback,
    void Function()? onTriggered,
  }) =>
      Tooltip(
        key: key,
        message: message,
        richMessage: richMessage,
        height: height,
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        excludeFromSemantics: excludeFromSemantics,
        decoration: decoration,
        textStyle: textStyle,
        textAlign: textAlign,
        waitDuration: waitDuration,
        showDuration: showDuration,
        exitDuration: exitDuration,
        enableTapToDismiss: enableTapToDismiss ?? true,
        triggerMode: triggerMode,
        enableFeedback: enableFeedback,
        onTriggered: onTriggered,
        child: this,
      );
}
