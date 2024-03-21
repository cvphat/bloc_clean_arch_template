import 'package:app/navigation/info/app_popup_info.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

@LazySingleton(as: BaseExceptionHandler)
class ExceptionHandler extends BaseExceptionHandler {
  @override
  Future<void> handleException(
    ExceptionWrapper exceptionWrapper,
    String exceptionMessage,
  ) async {
    switch (exceptionWrapper.appException.exceptionType) {
      case ExceptionType.remote:
      case ExceptionType.uncaught:
        final exception = exceptionWrapper.appException as AppUncaughtException;
        _showErrorDialog(message: exception.rootError.toString());
      default:
      //TODO:
    }
  }

  Future<void> _showErrorDialog({
    required String message,
    Function? onPressed,
    bool isRefreshTokenFailed = false,
  }) async {
    await navigator
        .showDialog(
      AppPopupInfo.confirmDialog(
        message: message,
        onPressed: onPressed,
      ),
    )
        .then((value) {
      if (isRefreshTokenFailed) {
        listener.onRefreshTokenFailed();
      }
    });
  }
}
