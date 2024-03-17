part of 'config.dart';

class SharedConfig extends Config {
  SharedConfig._();

  factory SharedConfig.getInstance() {
    return _instance;
  }

  static final SharedConfig _instance = SharedConfig._();

  @override
  Future<void> config() async => configureInjection();
}
