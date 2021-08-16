import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:discover/discover.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/dashboard/dashboard_module.dart';
import 'modules/setting/setting_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MovieRepository(apiRepository: i(), localRepository: i())),
    Bind.lazySingleton((i) => LocalRepository(prefHelper: i())),
    Bind.lazySingleton((i) => ApiRepository(apiService: i())),
    Bind.lazySingleton((i) => SharedPrefHelper()),
    Bind.lazySingleton((i) => ApiService(dio: i<DioClient>().dio)),
    Bind.lazySingleton((i) => DioClient(apiBaseUrl: ApiConstant.baseUrlDebug)),
    Bind.lazySingleton((i) => i<DioClient>().dio),
    //
    Bind.lazySingleton((i) => ApiConfigurations()),
    //
    Bind.lazySingleton((i) => CoffsyAnalytics()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/dashboard', module: DashboardModule()),
    ModuleRoute('/discover_movie', module: DiscoverModule()),
    ModuleRoute('/about', module: AboutModule()),
    ModuleRoute('/theme', module: SettingModule()),
  ];
}
