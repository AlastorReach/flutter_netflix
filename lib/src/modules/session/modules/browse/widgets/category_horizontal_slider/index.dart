import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_netflix_api_admin_web/src/infrastructure/responsive.dart';
import 'package:my_netflix_api_admin_web/src/infrastructure/router/router.dart';

class CategoryHorizontalSlider extends StatelessWidget {
  const CategoryHorizontalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double width = 290;
    const double height = 162;

    Map<String, double> getSizes() {
      if (Responsive.isMobile(context)) {
        return {"width": 100, "height": 200};
      }

      return {"width": 290, "height": 162};
    }

    final sizes = getSizes();

    return SizedBox(
      height: sizes['height'],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Hola'),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10, // number of items in your Netflix slider
              itemBuilder: (context, index) {
                return NetflixSliderItem(
                    title: 'Item $index',
                    description: 'Description of item $index',
                    width: sizes['width']!,
                    height: sizes['height']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NetflixSliderItem extends ConsumerWidget {
  final String title;
  final String description;
  final double width;
  final double height;

  const NetflixSliderItem(
      {super.key,
      required this.title,
      required this.description,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(routerProvider).go('/browse/watch'),
      child: Container(
        color: Colors.purple,
        height: height,
        width: width,
        child: Image.network(
          'https://occ-0-4668-3934.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABd1xOJSxaTL-0mVsdg0jc-DTfeh5wzz4DGMaLQqqN-2dhfGFRGMv8ZAEmOYVT66XgercNshD-SZ4u_18aLW3VUyA4frld5KCQEs.webp?r=1c1',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
