part of 'exceptions.dart';

class ServerError {
  final int? statusCode;
  final String? errorId;
  final String? message;
  final List<ServerErrorDetail> errors;

  const ServerError({
    this.errorId,
    this.statusCode,
    this.message,
    this.errors = defaultErrors,
  });

  static const defaultStatusCode = -1;
  static const defaultErrorId = '';
  static const defaultMessage = '';
  static const defaultErrors = <ServerErrorDetail>[];
}
