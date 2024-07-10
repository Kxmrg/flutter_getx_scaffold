import 'package:getx_scaffold/getx_scaffold.dart';

class DialogX {
  DialogX._();

  static DialogX get instance => DialogX._();

  void showConfirmDialog({
    String? title,
    required String messgae,
    String confirmText = '确认',
    String cancelText = '取消',
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
  }) {
    Get.dialog(
      _buildConfirmDialog(
        title: title,
        messgae: messgae,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
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

  Widget _buildConfirmDialog({
    String? title,
    required String messgae,
    required String confirmText,
    required String cancelText,
    Function? onConfirm,
    Function? onCancel,
  }) {
    return <Widget>[
      if (title.isNotEmptyOrNull)
        TextX.titleSmall(title!).padding(bottom: 16.h),
      TextX.bodyMedium(messgae).padding(bottom: 10.h),
      <Widget>[
        ButtonX.text(
          confirmText,
          textWeight: FontWeight.bold,
          minSize: Size(65.w, 0),
          onPressed: () {},
        ),
        ButtonX.text(
          cancelText,
          minSize: Size(65.w, 0),
          onPressed: () {},
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
        .width(0.7.sw)
        .center();
  }
}
