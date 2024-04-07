import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/data/providers/session_provider.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/route.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/route.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final sessionState = ref.watch(sessionProvider);

  final initialRoute = GoRoute(
      path: '/',
      redirect: (_, __) =>
          sessionState.isLoggedIn == true ? '/browse' : '/auth');
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [initialRoute, authRoutes, sessionRoutes],
  );
});
