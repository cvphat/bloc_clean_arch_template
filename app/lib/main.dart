import 'dart:async';

import 'package:app/app/my_app.dart';
import 'package:app/initializer/app_initializer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:shared/shared.dart';

import 'base/app_config.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppInitializer(AppConfig.getInstance()).init();
  final initialRoute = await loadInitialRoute<PageRouteInfo>();
  runApp(MyApp(initialRoute: initialRoute));
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}
