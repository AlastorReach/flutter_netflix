import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/data/providers/session_provider.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/route.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/route.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final sessionState = ref.watch(sessionProvider);

  if (sessionState.isLoggedIn) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [sessionRoutes],
      redirect: (_, GoRouterState state) {
        final fullPath = state.fullPath ?? '';
        inspect(state);
        print(fullPath);
        if (fullPath == '') {
          return '/session';
        }
        return null;
      },
    );
  }

  return GoRouter(
    initialLocation: '/',
    routes: [authRoutes],
  );
});
