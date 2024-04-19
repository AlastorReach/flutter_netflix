import 'package:flutter/material.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/browse/screens/browse_screen/views/who_is_watching/widgets/profiles/index.dart';

class WhoIsWatchingNowView extends StatelessWidget {
  const WhoIsWatchingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleLarge = Theme.of(context).textTheme.displayLarge;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '¿Quién está viendo ahora?',
                style: titleLarge,
              ),
              const SizedBox(
                height: 60,
              ),
              const Profiles(),
              const SizedBox(
                height: 100,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {},
                  child: const Text('Administrar perfiles'))
            ],
          ),
        ),
      ),
    );
  }
}
