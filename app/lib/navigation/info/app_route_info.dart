import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'app_route_info.freezed.dart';

@freezed
class AppRouteInfo extends BaseRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.home() = _Home;
}
