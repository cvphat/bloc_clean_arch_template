import 'package:data/src/di/di.dart';
import 'package:core/core.dart';

class DataConfig extends Config {
  factory DataConfig.getInstance() {
    return _instance;
  }

  DataConfig._();

  static final DataConfig _instance = DataConfig._();

  @override
  Future<void> config() async => configureInjection();
}
