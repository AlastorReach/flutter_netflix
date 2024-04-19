import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart' as Chewie;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subtitle/flutter_subtitle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_netflix_api_admin_web/src/infrastructure/router/router.dart';
import 'package:my_netflix_api_admin_web/src/presentation/common/widgets/netflix_video_player/custom_controls.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_style.dart';
//import 'package:subtitle_wrapper_package/subtitle_controller.dart';
//import 'package:subtitle_wrapper_package/subtitle_controller.dart';
//import 'package:subtitle_wrapper_package/subtitle_wrapper.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_subtitle/flutter_subtitle.dart' as FlutterSubTitle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'src/infrastructure/custom_scroll_behavior.dart';
import 'src/presentation/common/widgets/flutter_hover_icon/index.dart';

void main() {
  runApp(const ProviderScope(child: App()) );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Netflix Video Player with Chewie',
      theme: ThemeData.dark(),
      routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
         supportedLocales: AppLocalizations.supportedLocales,
         scrollBehavior: CustomScrollBehavior(),

    );
  }
}
