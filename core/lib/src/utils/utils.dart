import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'log_util.dart';
part 'dispose_bag.dart';

Future<List<T>> loadInitialRoute<T>() async {
  final result = runCatching(
    action: () => GetIt.instance
        .get<BaseLoadInitialRouteUseCase>()
        .execute(const LoadInitialRouteInput()),
  );

  final output = result.when(
    success: (output) => output,
    failure: (e) => const LoadInitialRouteOutput(),
  );

  final mapper = GetIt.instance.get<BaseRouteInfoMapper<T>>();

  return mapper.mapList(output.routes);
}
