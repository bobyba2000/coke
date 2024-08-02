import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/service/point.dart';

class ServiceDependencies {
  static void init() {
    AppDependencies.injector.registerFactory(() => PointService());
  }
}
