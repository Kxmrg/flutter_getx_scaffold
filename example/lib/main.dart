import 'package:example/home/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

void main() {
  init(isDebug: true, logTag: 'example');
  runApp(const GetxApp(
    designSize: Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: true,
    defaultTransition: Transition.rightToLeft,
    title: 'Example',
    home: HomePage(),
  ));
}
