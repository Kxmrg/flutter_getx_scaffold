import 'package:example/home/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

void main() {
  init(isDebug: true, logTag: 'example');
  runApp(const GetxApp(
    // 设计稿中设备的尺寸,单位dp
    designSize: Size(390, 844),
    // 支持分屏尺寸
    minTextAdapt: true,
    // 是否根据宽度/高度中的最小值适配文字
    splitScreenMode: true,
    // title
    title: 'Example',
    // 默认过渡动画
    defaultTransition: Transition.rightToLeft,
    // HomePage
    home: HomePage(),
  ));
}
