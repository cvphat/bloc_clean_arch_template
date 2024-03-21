part of 'exceptions.dart';

abstract class BaseException implements Exception {
  const BaseException(this.exceptionType);

  final ExceptionType exceptionType;
}

enum ExceptionType {
  remote,
  parse,
  remoteConfig,
  uncaught,
  validation,
}
