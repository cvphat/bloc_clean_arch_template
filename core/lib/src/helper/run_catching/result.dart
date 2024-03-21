part of 'run_catching.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success;
  const factory Result.failure(BaseException exception) = _Error;
}
