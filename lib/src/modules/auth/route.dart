import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/modules/signin/screens/signin/signin_screen.dart';

final authRoutes = GoRoute(
    path: '/auth',
    builder: (context, state) => const SigninScreen(),
    routes: [
      GoRoute(
        path: 'signin',
        builder: (context, state) => const SigninScreen(),
      )
    ]);
