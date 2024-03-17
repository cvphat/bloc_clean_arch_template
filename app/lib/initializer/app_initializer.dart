import 'package:app/base/app_config.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final BaseAppConfig _applicationConfig;

  Future<void> init() async {
    // TODO: load env config
    await SharedConfig.getInstance().init();
    await DataConfig.getInstance().init();
    await DomainConfig.getInstance().init();
    await _applicationConfig.init();
  }
}
