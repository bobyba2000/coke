import 'package:coke_platform/presentation/admin/page.dart';
import 'package:coke_platform/presentation/application/page.dart';
import 'package:coke_platform/presentation/landing/page.dart';
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
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        path: '/apply',
        builder: (context, state) => const ApplicationPage(),
      ),
    ],
  );
}
