import 'package:app/navigation/info/app_route_info.dart';
import 'package:app/navigation/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper<PageRouteInfo> {
  @override
  PageRouteInfo map(BaseRouteInfo routeInfo) {
    if (routeInfo is LoginRouteInfo) {
      return const LoginRoute();
    }
    final appRouteInfo = routeInfo as AppRouteInfo;
    return appRouteInfo.when(
      home: () => const HomeRoute(),
    );
  }
}
