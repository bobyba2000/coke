import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/presentation/admin/page.dart';
import 'package:coke_platform/presentation/admin/page/login/page.dart';
import 'package:coke_platform/presentation/application/page.dart';
import 'package:coke_platform/presentation/contestant/page.dart';
import 'package:coke_platform/presentation/landing/page.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:coke_platform/service/firebase/role.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/admin',
        name: '/admin',
        redirect: (context, state) async {
          final auth = AppDependencies.injector.get<FirebaseAuthService>();
          if (!auth.isUserSignedIn()) {
            return '/login';
          }
          final roleService = AppDependencies.injector.get<FirebaseRoleService>();
          final role = await roleService.getUserRole(auth.getUserId()!);
          if (role == 'Admin') {
            return null;
          } else {
            auth.logout();
            return '/login';
          }
        },
        builder: (context, state) {
          final query = state.uri.queryParameters;
          final contestantKey = query['contestant'];
          return AdminPage(
            contestantKey: contestantKey,
          );
        },
      ),
      GoRoute(
        name: '/login',
        path: '/login',
        redirect: (context, state) async {
          final auth = AppDependencies.injector.get<FirebaseAuthService>();
          if (!auth.isUserSignedIn()) {
            return '/login';
          }
          final roleService = AppDependencies.injector.get<FirebaseRoleService>();
          final role = await roleService.getUserRole(auth.getUserId()!);
          if (role == 'Admin') {
            return null;
          } else {
            return '/contestant';
          }
        },
        builder: (context, state) => const AdminLoginPage(),
      ),
      GoRoute(
        path: '/apply',
        builder: (context, state) => const ApplicationPage(),
      ),
      GoRoute(
        name: '/contestant',
        path: '/contestant',
        redirect: (context, state) async {
          final auth = AppDependencies.injector.get<FirebaseAuthService>();
          if (!auth.isUserSignedIn()) {
            return '/login';
          }
          final roleService = AppDependencies.injector.get<FirebaseRoleService>();
          final role = await roleService.getUserRole(auth.getUserId()!);
          if (role == 'Admin') {
            return null;
          } else {
            return '/contestant';
          }
        },
        builder: (context, state) => const ContestantPage(),
      ),
    ],
  );
}
