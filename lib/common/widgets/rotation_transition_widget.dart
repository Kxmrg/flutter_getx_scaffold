import 'package:flutter/material.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-04
 * @description: 
 */

/// 旋转动画
class RotationTransitionWidget extends StatefulWidget {
  final Widget child;
  final RotationTransitionController controller;
  final bool autoplay;
  final int milliseconds;

  const RotationTransitionWidget(
    this.child,
    this.controller, {
    super.key,
    this.autoplay = false,
    this.milliseconds = 1000,
  });

  @override
  State<RotationTransitionWidget> createState() =>
      _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.milliseconds), vsync: this);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.controller.isPlaying) {
        animationController.reset();
        animationController.forward();
      }
    });
    widget.controller.addListener(() {
      if (widget.controller.isPlaying) {
        animationController.reset();
        animationController.forward();
      }
    });
    if (widget.autoplay) {
      widget.controller.start();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      //设置动画的旋转中心
      alignment: Alignment.center,
      //动画控制器
      turns: animationController,
      //将要执行动画的子view
      child: widget.child,
    );
  }
}

class RotationTransitionController extends ChangeNotifier {
  bool _isPlaying = false;

  void start() {
    _isPlaying = true;
    notifyListeners();
  }

  void stop() {
    _isPlaying = false;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;
}
