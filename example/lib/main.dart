import 'package:example/home/index.dart';
import 'package:example/styles/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

void main() async {
  await init(isDebug: kDebugMode, logTag: 'example');
  runApp(
    GetxApp(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      enableLog: kDebugMode,
      defaultTransition: Transition.rightToLeft,
      themeMode: GlobalService.to.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      title: 'Example',
      home: const HomePage(),
    ),
  );
}
