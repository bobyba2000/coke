import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:coke_platform/service/firebase/contestant.dart';
import 'package:coke_platform/service/firebase/role.dart';
import 'package:coke_platform/service/firebase/storage.dart';

class FirebaseDependecies {
  static void init() {
    AppDependencies.injector.registerSingleton(FirebaseContestantService());
    AppDependencies.injector.registerSingleton(FirebaseStorageService());
    AppDependencies.injector.registerSingleton(FirebaseAuthService());
    AppDependencies.injector.registerSingleton(FirebaseRoleService());
  }
}
