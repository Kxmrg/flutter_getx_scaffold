import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-29
 * @description: 
 */

/// GetxAppWidegt
class GetxApp extends StatelessWidget {
  final Size designSize;
  final bool splitScreenMode;
  final bool minTextAdapt;
  final bool useInheritedMediaQuery;
  final bool ensureScreenSize;
  final bool Function()? enableScaleWH;
  final bool Function()? enableScaleText;
  final Iterable<String>? responsiveWidgets;
  final Iterable<String>? excludeWidgets;
  final double Function(num, ScreenUtil) fontSizeResolver;

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, Widget Function(BuildContext)> routes;
  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TextDirection? textDirection;
  final String title;
  final String Function(BuildContext)? onGenerateTitle;
  final Color? color;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final Locale? locale;
  final Locale? fallbackLocale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ScrollBehavior? scrollBehavior;
  final CustomTransition? customTransition;
  final Map<String, Map<String, String>>? translationsKeys;
  final Translations? translations;
  final void Function()? onInit;
  final void Function()? onReady;
  final void Function()? onDispose;
  final void Function(Routing?)? routingCallback;
  final Transition? defaultTransition;
  final List<GetPage<dynamic>>? getPages;
  final bool? opaqueRoute;
  final bool? enableLog;
  final void Function(String, {bool isError})? logWriterCallback;
  final bool? popGesture;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final SmartManagement smartManagement;
  final Bindings? initialBinding;
  final GetPage<dynamic>? unknownRoute;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final TransitionBuilder? builder;

  const GetxApp({
    super.key,
    this.designSize = ScreenUtil.defaultSize,
    this.splitScreenMode = false,
    this.minTextAdapt = false,
    this.useInheritedMediaQuery = false,
    this.ensureScreenSize = false,
    this.enableScaleWH,
    this.enableScaleText,
    this.responsiveWidgets,
    this.excludeWidgets,
    this.fontSizeResolver = FontSizeResolvers.width,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.textDirection,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.locale,
    this.fallbackLocale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.customTransition,
    this.translationsKeys,
    this.translations,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.routingCallback,
    this.defaultTransition,
    this.getPages,
    this.opaqueRoute,
    this.enableLog = kDebugMode,
    this.logWriterCallback,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.smartManagement = SmartManagement.full,
    this.initialBinding,
    this.unknownRoute,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    //ScreenUtil屏幕适配
    return ScreenUtilInit(
      designSize: designSize,
      splitScreenMode: splitScreenMode,
      minTextAdapt: minTextAdapt,
      useInheritedMediaQuery: useInheritedMediaQuery,
      ensureScreenSize: ensureScreenSize,
      enableScaleWH: enableScaleWH,
      enableScaleText: enableScaleText,
      fontSizeResolver: fontSizeResolver,
      responsiveWidgets: responsiveWidgets,
      excludeWidgets: excludeWidgets,
      builder: (context, child) {
        //pull_to_refresh全局配置
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          textDirection: textDirection,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode ?? GlobalService.to.themeMode,
          locale: locale,
          fallbackLocale: fallbackLocale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          scrollBehavior: scrollBehavior,
          customTransition: customTransition,
          translationsKeys: translationsKeys,
          translations: translations,
          onInit: onInit,
          onReady: onReady,
          onDispose: onDispose,
          routingCallback: routingCallback,
          defaultTransition: defaultTransition,
          getPages: getPages,
          opaqueRoute: opaqueRoute,
          enableLog: enableLog,
          logWriterCallback: logWriterCallback,
          popGesture: popGesture,
          transitionDuration: transitionDuration,
          defaultGlobalState: defaultGlobalState,
          smartManagement: smartManagement,
          initialBinding: initialBinding,
          unknownRoute: unknownRoute,
          highContrastTheme: highContrastTheme,
          highContrastDarkTheme: highContrastDarkTheme,
          actions: actions,
          builder: (context, widget) {
            // EasyLoading 初始化
            widget = EasyLoading.init()(context, widget);
            Loading.init();
            // 不随系统字体缩放比例
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: builder == null ? widget : builder!(context, widget),
            );
          },
        );
      },
    );
  }
}
