import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/model/data/response/point/model.dart';
import 'package:coke_platform/model/data/response/void/model.dart';

class DataModelDependencies {
  static void init() {
    AppDependencies.injector.registerFactory<PointResponseModel>(() => PointResponseModel());
    AppDependencies.injector.registerFactory<VoidResponseModel>(() => VoidResponseModel());
  }
}
