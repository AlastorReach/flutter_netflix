import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/admin/screens/mainScreen/main_screen.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/admin/screens/mainScreen/screens/createMovie/create_movie_screen.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/admin/screens/mainScreen/screens/createSeries/create_series_screen.dart';

final adminRoutes = ShellRoute(
    builder: (context, state, child) => MainScreen(
          child: child,
        ),
    routes: [
      GoRoute(
          path: 'dashboard',
          builder: (context, state) => const CreateMovieScreen(),
          routes: [
            GoRoute(
              path: 'create-movie',
              builder: (context, state) => const CreateMovieScreen(),
            ),
            GoRoute(
              path: 'create-series',
              builder: (context, state) => const CreateSeriesScreen(),
            )
          ])
    ]);
