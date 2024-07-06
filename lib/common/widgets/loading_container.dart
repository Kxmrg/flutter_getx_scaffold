import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

enum LoadingStatus {
  loading,
  error,
  empty,
  complete,
}

class LoadController extends ChangeNotifier {
  LoadingStatus status = LoadingStatus.loading;

  void loading() {
    status = LoadingStatus.loading;
    notifyListeners();
  }

  void error() {
    status = LoadingStatus.error;
    notifyListeners();
  }

  void empty() {
    status = LoadingStatus.empty;
    notifyListeners();
  }

  void complete() {
    status = LoadingStatus.complete;
    notifyListeners();
  }
}

class LoadingContainer extends StatefulWidget {
  final LoadController controller;
  final Widget child;
  final Widget? loadingWidget;
  final String? loadingMessage;
  final Widget? errorWidget;
  final String? errorMessage;
  final Widget? emptyWidget;
  final String? emptyMessage;
  final Function? onReLoad;

  const LoadingContainer({
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
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  LoadingStatus status = LoadingStatus.loading;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        status = widget.controller.status;
      });
    });
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: SpinKitFoldingCube(
        color: ThemeColor.primary,
        size: 24.sp,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: TextX.bodyLarge(widget.errorMessage ?? '网络错误,点击重试'),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: TextX.bodyLarge(widget.emptyMessage ?? '暂无数据,点击重试'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget ws;
    switch (status) {
      case LoadingStatus.loading:
        ws = widget.loadingWidget ?? _buildLoadingWidget();
        break;
      case LoadingStatus.error:
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
      case LoadingStatus.empty:
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
      case LoadingStatus.complete:
        ws = widget.child;
        break;
    }
    return SafeArea(child: ws);
  }
}
