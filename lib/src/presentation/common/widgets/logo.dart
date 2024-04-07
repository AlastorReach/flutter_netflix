import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/SVGs/netflix_logo.svg',
        colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 229, 9, 20), BlendMode.srcIn),
        semanticsLabel: 'Netflix Logo');
  }
}
