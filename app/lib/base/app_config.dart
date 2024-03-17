import 'package:app/app/bloc/app_bloc_observer.dart';
import 'package:app/di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

abstract class BaseAppConfig extends Config {}

class AppConfig extends BaseAppConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<void> config() async {
    configureInjection();
    Bloc.observer = AppBlocObserver();
    if (!kIsWeb) {
      // TODO: config for none web
    }
  }
}
