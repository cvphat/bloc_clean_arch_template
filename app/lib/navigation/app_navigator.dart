import 'package:shared/shared.dart';

import 'router/app_router.dart';

class AppNavigator extends BaseNavigator with LogMixin {
  AppNavigator(
    this._appRouter,
    this._appPopupInfoMapper,
    this._appRouteInfoMapper,
  );

  final AppRouter _appRouter;
  final BasePopupInfoMapper _appPopupInfoMapper;
  final BaseRouteInfoMapper _appRouteInfoMapper;

  @override
  // TODO: implement canPopSelfOrChildren
  bool get canPopSelfOrChildren => throw UnimplementedError();

  @override
  // TODO: implement currentBottomTab
  int get currentBottomTab => throw UnimplementedError();

  @override
  Future<bool> pop<T extends Object?>(
      {T? result, bool useRootNavigator = false}) {
    // TODO: implement pop
    throw UnimplementedError();
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
      BaseRouteInfo routeInfo,
      {R? result,
      bool useRootNavigator = false}) {
    // TODO: implement popAndPush
    throw UnimplementedError();
  }

  @override
  Future<void> popAndPushAll(List<BaseRouteInfo> listRouteInfo,
      {bool useRootNavigator = false}) {
    // TODO: implement popAndPushAll
    throw UnimplementedError();
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    // TODO: implement popUntilRoot
  }

  @override
  void popUntilRouteName(String routeName) {
    // TODO: implement popUntilRouteName
  }

  @override
  Future<T?> push<T extends Object?>(BaseRouteInfo routeInfo) {
    // TODO: implement push
    throw UnimplementedError();
  }

  @override
  Future<void> pushAll(List<BaseRouteInfo> listRouteInfo) {
    // TODO: implement pushAll
    throw UnimplementedError();
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    // TODO: implement removeAllRoutesWithName
    throw UnimplementedError();
  }

  @override
  bool removeLast() {
    // TODO: implement removeLast
    throw UnimplementedError();
  }

  @override
  bool removeUntilRouteName(String routeName) {
    // TODO: implement removeUntilRouteName
    throw UnimplementedError();
  }

  @override
  Future<T?> replace<T extends Object?>(BaseRouteInfo routeInfo) {
    // TODO: implement replace
    throw UnimplementedError();
  }

  @override
  Future<void> replaceAll(List<BaseRouteInfo> listRouteInfo) {
    // TODO: implement replaceAll
    throw UnimplementedError();
  }

  @override
  Future<T?> showDialog<T extends Object?>(BasePopupInfo appPopupInfo,
      {bool barrierDismissible = true,
      bool useSafeArea = false,
      bool useRootNavigator = true}) {
    // TODO: implement showDialog
    throw UnimplementedError();
  }
}
