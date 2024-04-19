import 'package:flutter/material.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/browse/screens/browse_screen/views/browser/index.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/browse/screens/browse_screen/views/who_is_watching/index.dart';

import '../../../../../../presentation/common/widgets/netflix_video_player/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowerView();
  }
}
