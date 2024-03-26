import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/admin/route.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/home/screens/home/home_screen.dart';

final sessionRoutes = GoRoute(
    path: '/session',
    builder: (context, state) => const HomeScreen(),
    routes: [adminRoutes]);
