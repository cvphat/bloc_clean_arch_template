part of 'navigation.dart';

abstract class BaseRouteInfoMapper<T> {
  T map(BaseRouteInfo routeInfo);

  List<T> mapList(List<BaseRouteInfo> listRouteInfo) {
    return listRouteInfo.map(map).toList(growable: false);
  }
}
