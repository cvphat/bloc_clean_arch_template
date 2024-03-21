import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BaseLoadInitialRouteUseCase
    extends BaseSyncUseCase<LoadInitialRouteInput, LoadInitialRouteOutput> {
  @protected
  @override
  LoadInitialRouteOutput buildUseCase(LoadInitialRouteInput input);
}

class LoadInitialRouteInput extends BaseInput {
  const LoadInitialRouteInput();
}

class LoadInitialRouteOutput extends BaseOutput {
  final List<BaseRouteInfo> routes;
  const LoadInitialRouteOutput({this.routes = const []});
}
