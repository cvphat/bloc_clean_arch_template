part of 'exceptions.dart';

class ServerErrorDetail {
  final String? path;
  final String? detail;
  final String? errorId;
  final int? statusCode;
  final String? message;
  final String? field;

  const ServerErrorDetail({
    this.path,
    this.detail,
    this.errorId,
    this.statusCode,
    this.message,
    this.field,
  });
}
