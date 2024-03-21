import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

@Injectable(as: BaseLoadInitialRouteUseCase)
class LoadInitialResourceUseCase extends BaseLoadInitialRouteUseCase {
  @override
  LoadInitialRouteOutput buildUseCase(
    LoadInitialRouteInput input,
  ) {
    //TODO: consider check permision to have initial route
    return const LoadInitialRouteOutput(routes: [LoginRouteInfo()]);
  }
}
