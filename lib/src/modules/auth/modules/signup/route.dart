import 'package:go_router/go_router.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/modules/signup/screens/personalData/personal_data_screen.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/modules/signup/screens/screenTwo/screen-two.dart';

final signUpRoutes = GoRoute(path: '/signup', routes: [
  GoRoute(
      path: 'personal-data',
      builder: (context, state) => const PersonalDataScreen(),
      routes: [
        GoRoute(
          path: 'signup-screen-two',
          builder: (context, state) => const SignupScreenTwo(),
        )
      ])
]);
