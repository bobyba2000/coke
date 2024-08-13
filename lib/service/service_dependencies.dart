import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/service/excel.dart';
import 'package:coke_platform/service/mail.dart';
import 'package:coke_platform/service/point.dart';

class ServiceDependencies {
  static void init() {
    AppDependencies.injector.registerFactory(() => PointService());
    AppDependencies.injector.registerFactory(() => ExcelService());
    AppDependencies.injector.registerFactory(() => MailService());
  }
}
