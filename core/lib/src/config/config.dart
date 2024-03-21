import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

part 'duration_constants.dart';
part 'log_config.dart';

abstract class Config {
  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer<void>();

  Future<void> config();

  Future<void> init() => _asyncMemoizer.runOnce(config);
}
