import 'dart:async';

import 'package:core/core.dart';

part 'base_exception.dart';
part 'base_exception_handler.dart';
part 'base_exception_mapper.dart';
part 'exception_wrapper.dart';
part 'exception_listener.dart';
part 'server_error.dart';
part 'server_error_detail.dart';

class RemoteException extends BaseException {
  const RemoteException({
    required this.kind,
    this.errorCode,
    this.serverError,
    this.rootException,
  }) : super(ExceptionType.remote);

  final RemoteExceptionKind kind;

  final int? errorCode;
  final ServerError? serverError;
  final Object? rootException;

  int get statusCode =>
      serverError?.statusCode ??
      serverError?.errors.firstOrNull?.statusCode ??
      -1;

  String? get errorId =>
      serverError?.errorId ?? serverError?.errors.firstOrNull?.errorId;

  String? get message =>
      serverError?.message ?? serverError?.errors.firstOrNull?.message;

  @override
  String toString() {
    return '''RemoteException: {
      kind: $kind
      errorCode: $errorCode,
      serverError: $serverError,
      rootException: $rootException,
      message: $message,
      statusCode: $statusCode,
      errorId: $errorId,
      stackTrace: ${rootException is Error ? (rootException as Error).stackTrace : ''}
}''';
  }
}

enum RemoteExceptionKind {
  noInternet,

  /// host not found, cannot connect to host, SocketException
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  /// Caused by an incorrect certificate as configured by [ValidateCertificate]
  badCertificate,

  /// error occurs when passing JSON
  decodeError,

  refreshTokenFailed,
  timeout,
  cancellation,
  unknown,
}

class AppUncaughtException extends BaseException {
  const AppUncaughtException(this.rootError) : super(ExceptionType.uncaught);

  final Object? rootError;

  @override
  String toString() {
    return 'rootError: ${rootError?.toString()}';
  }
}
