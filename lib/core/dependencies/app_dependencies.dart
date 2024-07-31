import 'package:coke_platform/bloc/bloc_dependencies.dart';
import 'package:coke_platform/core/service/rest_utils.dart';
import 'package:coke_platform/model/data/dependencies.dart';
import 'package:coke_platform/service/firebase/dependecies.dart';
import 'package:coke_platform/service/service_dependencies.dart';
import 'package:get_it/get_it.dart';

class AppDependencies {
  static GetIt injector = GetIt.instance;

  AppDependencies._();

  static void init() {
    injector.registerFactory(
      () => RestUtils(
        'https://api.weatherapi.com/v1/',
      ),
    );
    DataModelDependencies.init();
    ServiceDependencies.init();
    BlocDependencies.init();
    FirebaseDependecies.init();
  }
}
