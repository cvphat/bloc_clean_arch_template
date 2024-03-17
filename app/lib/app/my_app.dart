import 'package:app/base/page_state.dart';
import 'package:app/navigation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared/shared.dart';

import 'bloc/app_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({required this.initialRoute, super.key});

  final List<PageRouteInfo> initialRoute;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends PageState<MyApp, AppBloc> {
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.add(const AppInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: FlexThemeData.light(
              scheme: FlexScheme.dellGenoa,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 7,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 10,
                blendOnColors: false,
                useTextTheme: true,
                useM2StyleDividerInM3: true,
                alignedDropdown: true,
                useInputDecoratorThemeInDialogs: true,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              // TODO: consider set font
              // fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.dellGenoa,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 13,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 20,
                useTextTheme: true,
                useM2StyleDividerInM3: true,
                alignedDropdown: true,
                useInputDecoratorThemeInDialogs: true,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              // TODO: consider set font
              // fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            themeMode: state.themeMode,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(
              deepLinkBuilder: (deepLink) {
                return DeepLink(widget.initialRoute);
              },
              navigatorObservers: () => [AppNavigatorObserver()],
            ),
          );
        },
      ),
    );
  }
}
