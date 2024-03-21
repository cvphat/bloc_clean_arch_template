import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton(as: BaseExceptionMapper)
class ExceptionMapper extends BaseExceptionMapper {
  @override
  String map(BaseException appException) {
    switch (appException) {
      case RemoteException remoteException:
        return remoteException.kind.name;
      case AppUncaughtException uncaughtException:
        return uncaughtException.rootError?.toString() ?? '';
      default:
        return S.current.errorUnknow;
    }
  }
}
