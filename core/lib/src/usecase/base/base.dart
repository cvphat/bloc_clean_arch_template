import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

part 'base_clear_user_data_use_case.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}
