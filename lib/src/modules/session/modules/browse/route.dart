import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/browse/screens/watch_screen/index.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/home/screens/home/home_screen.dart';

final browseRoutes = GoRoute(
    path: '/browse',
    builder: (context, state) => const HomeScreen(),
    routes: [GoRoute(path: 'watch', builder: (context, state) => const WatchScreen(),)]);