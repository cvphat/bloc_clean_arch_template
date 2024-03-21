part of 'exceptions.dart';

class ExceptionWrapper {
  const ExceptionWrapper({
    required this.appException,
    this.exceptionCompleter,
    this.doOnRetry,
    this.overrideMessage,
  });

  final BaseException appException;
  final Completer<void>? exceptionCompleter;
  final Future<void> Function()? doOnRetry;
  final String? overrideMessage;

  @override
  String toString() {
    return 'AppExceptionWrapper(appException: $appException, exceptionCompleter: $exceptionCompleter, doOnRetry: $doOnRetry, overrideMessage: $overrideMessage)';
  }
}
