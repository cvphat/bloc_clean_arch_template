import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.dart';
part 'run_catching.freezed.dart';

Result<O> runCatching<O>({
  required O Function() action,
}) {
  try {
    return Result.success(action.call());
  } on BaseException catch (e) {
    return Result.failure(e);
  }
}

Future<Result<O>> runAsyncCatching<O>({
  required Future<O> Function() action,
}) async {
  try {
    final output = await action.call();

    return Result.success(output);
  } on BaseException catch (e) {
    return Result.failure(e);
  }
}
