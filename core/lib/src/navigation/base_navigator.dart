part of 'navigation.dart';

abstract class BaseNavigator {
  bool get canPopSelfOrChildren;

  int get currentBottomTab;

  Future<T?> replace<T extends Object?>(BaseRouteInfo routeInfo);

  Future<T?> push<T extends Object?>(BaseRouteInfo routeInfo);

  Future<void> pushAll(List<BaseRouteInfo> listRouteInfo);

  Future<void> replaceAll(List<BaseRouteInfo> listRouteInfo);

  Future<bool> maybePop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  });

  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    BaseRouteInfo routeInfo, {
    R? result,
    bool useRootNavigator = false,
  });

  Future<void> popAndPushAll(List<BaseRouteInfo> listRouteInfo,
      {bool useRootNavigator = false});

  void popUntilRoot({bool useRootNavigator = false});

  void popUntilRouteName(String routeName);

  bool removeUntilRouteName(String routeName);

  bool removeAllRoutesWithName(String routeName);

  bool removeLast();

  Future<T?> showDialog<T extends Object?>(
    BasePopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  });
}
