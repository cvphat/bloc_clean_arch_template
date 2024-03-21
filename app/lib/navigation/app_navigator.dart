import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';
import 'info/app_popup_info.dart';
import 'router/app_router.dart';

@LazySingleton(as: BaseNavigator)
class AppNavigator extends BaseNavigator with LogMixin {
  AppNavigator(
    this._appRouter,
    this._appPopupInfoMapper,
    this._appRouteInfoMapper,
  );

  final AppRouter _appRouter;
  final BasePopupInfoMapper _appPopupInfoMapper;
  final BaseRouteInfoMapper<PageRouteInfo> _appRouteInfoMapper;
  final _shownPopups = <AppPopupInfo, Completer<dynamic>>{};

  final tabRoutes = const [];
  TabsRouter? tabsRouter;

  StackRouter? get _currentTabRouter =>
      tabsRouter?.stackRouterOfIndex(currentBottomTab);

  StackRouter get _currentTabRouterOrRootRouter =>
      _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext =>
      _appRouter.navigatorKey.currentContext!;

  m.BuildContext? get _currentTabRouterContext =>
      _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext =>
      _currentTabRouterContext ?? _rootRouterContext;

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  @override
  Future<bool> maybePop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pop with result = $result, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.maybePop<T>(result)
        : _currentTabRouterOrRootRouter.maybePop<T>(result);
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    BaseRouteInfo routeInfo, {
    R? result,
    bool useRootNavigator = false,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD(
          'popAndPush $routeInfo with result = $result, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.popAndPush<T, R>(_appRouteInfoMapper.map(routeInfo),
            result: result)
        : _currentTabRouterOrRootRouter.popAndPush<T, R>(
            _appRouteInfoMapper.map(routeInfo),
            result: result,
          );
  }

  @override
  Future<void> popAndPushAll(
    List<BaseRouteInfo> listRouteInfo, {
    bool useRootNavigator = false,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popAndPushAll $listRouteInfo, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.popAndPushAll(_appRouteInfoMapper.mapList(listRouteInfo))
        : _currentTabRouterOrRootRouter
            .popAndPushAll(_appRouteInfoMapper.mapList(listRouteInfo));
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRoot, useRootNav = $useRootNavigator');
    }

    useRootNavigator
        ? _appRouter.popUntilRoot()
        : _currentTabRouterOrRootRouter.popUntilRoot();
  }

  @override
  void popUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRouteName $routeName');
    }

    _appRouter.popUntilRouteWithName(routeName);
  }

  @override
  Future<T?> push<T extends Object?>(BaseRouteInfo routeInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('push $routeInfo');
    }

    return _appRouter.push<T>(_appRouteInfoMapper.map(routeInfo));
  }

  @override
  Future<void> pushAll(List<BaseRouteInfo> listRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushAll $listRouteInfo');
    }

    return _appRouter.pushAll(_appRouteInfoMapper.mapList(listRouteInfo));
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeAllRoutesWithName $routeName');
    }

    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  @override
  bool removeLast() {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeLast');
    }

    return _appRouter.removeLast();
  }

  @override
  bool removeUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeUntilRouteName $routeName');
    }

    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  @override
  Future<T?> replace<T extends Object?>(BaseRouteInfo routeInfo) {
    _shownPopups.clear();
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replace by $routeInfo');
    }

    return _appRouter.replace<T>(_appRouteInfoMapper.map(routeInfo));
  }

  @override
  Future<void> replaceAll(List<BaseRouteInfo> listRouteInfo) {
    _shownPopups.clear();
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replaceAll by $listRouteInfo');
    }

    return _appRouter.replaceAll(_appRouteInfoMapper.mapList(listRouteInfo));
  }

  @override
  Future<T?> showDialog<T extends Object?>(
    BasePopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    if (_shownPopups.containsKey(appPopupInfo)) {
      logD('Dialog $appPopupInfo already shown');

      return _shownPopups[appPopupInfo]!.future.safeCast();
    }
    _shownPopups[appPopupInfo as AppPopupInfo] = Completer<T?>();

    return m.showDialog<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      builder: (_) => m.PopScope(
        onPopInvoked: (canPop) async {
          logD('Dialog $appPopupInfo dismissed');
          _shownPopups.remove(appPopupInfo);
        },
        child: _appPopupInfoMapper.map(appPopupInfo, this),
      ),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }
}
