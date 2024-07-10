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

/// 加载状态
enum LoadStatus {
  loading,
  error,
  empty,
  complete,
}

/// 加载控制器
class LoadController extends ChangeNotifier {
  LoadStatus status = LoadStatus.loading;

  void loading() {
    status = LoadStatus.loading;
    notifyListeners();
  }

  void error() {
    status = LoadStatus.error;
    notifyListeners();
  }

  void empty() {
    status = LoadStatus.empty;
    notifyListeners();
  }

  void complete() {
    status = LoadStatus.complete;
    notifyListeners();
  }
}

class LoadContainer extends StatefulWidget {
  final LoadController controller;
  final Widget child;
  final Widget? loadingWidget;
  final String? loadingMessage;
  final Widget? errorWidget;
  final String? errorMessage;
  final Widget? emptyWidget;
  final String? emptyMessage;
  final Function? onReLoad;

  const LoadContainer({
    super.key,
    required this.controller,
    required this.child,
    this.loadingWidget,
    this.loadingMessage,
    this.errorWidget,
    this.errorMessage,
    this.emptyWidget,
    this.emptyMessage,
    this.onReLoad,
  });

  @override
  State<LoadContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadContainer>
    with TickerProviderStateMixin {
  late AnimationController _loadingAnimationController;
  late Animation<double> _loadingAnimation;
  late AnimationController _childAnimationController;
  late Animation<double> _childAnimation;

  @override
  void initState() {
    super.initState();
    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: widget.controller.status == LoadStatus.loading ? 1.0 : 0.0,
    );
    _loadingAnimation = _loadingAnimationController.view;
    _childAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      value: widget.controller.status == LoadStatus.loading ? 0.0 : 1.0,
    );
    _childAnimation = _childAnimationController.view;
    widget.controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    setState(() {
      _loadingAnimationController.animateTo(
          widget.controller.status == LoadStatus.loading ? 1.0 : 0.0);
      _childAnimationController.animateTo(
          widget.controller.status == LoadStatus.loading ? 0.0 : 1.0);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _loadingAnimationController.dispose();
    _childAnimationController.dispose();
    super.dispose();
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: SpinKitRipple(
        color: ThemeColor.primaryContainer,
        size: 60.sp,
      ).padding(bottom: 50.h),
    );
  }

  Widget _buildErrorWidget() {
    return <Widget>[
      Lottie.asset(
        'assets/lottie/error.json',
        package: pluginPackageName,
        width: 0.6.sw,
        height: 0.6.sw,
      ),
      TextX.labelMedium(widget.emptyMessage ?? '网络错误,点击重试'),
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center)
        .padding(top: 80.h);
  }

  Widget _buildEmptyWidget() {
    return <Widget>[
      Lottie.asset(
        'assets/lottie/error.json',
        package: pluginPackageName,
        width: 0.6.sw,
        height: 0.6.sw,
      ),
      TextX.labelMedium(widget.emptyMessage ?? '暂无数据,点击重试'),
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center)
        .padding(top: 80.h);
  }

  @override
  Widget build(BuildContext context) {
    Widget? ws;
    switch (widget.controller.status) {
      case LoadStatus.error:
        ws = SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.errorWidget ?? _buildErrorWidget(),
        ).onTap(() {
          if (widget.onReLoad != null) {
            widget.onReLoad!();
          }
        });
        break;
      case LoadStatus.empty:
        ws = SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.emptyWidget ?? _buildEmptyWidget(),
        ).onTap(() {
          if (widget.onReLoad != null) {
            widget.onReLoad!();
          }
        });
        break;
      case LoadStatus.complete:
        ws = widget.child;
        break;
      default:
        break;
    }
    return Stack(children: [
      if (ws != null)
        FadeTransition(
          opacity: _childAnimation,
          child: ws,
        ),
      FadeTransition(
        opacity: _loadingAnimation,
        child: _buildLoadingWidget(),
      ),
    ]);
  }
}
