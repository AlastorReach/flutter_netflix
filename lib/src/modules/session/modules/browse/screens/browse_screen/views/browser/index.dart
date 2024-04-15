import 'package:flutter/material.dart';
import 'package:my_netflix_api_admin_web/src/modules/session/modules/browse/widgets/category_horizontal_slider/index.dart';

class BrowerView extends StatelessWidget {
  const BrowerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return const Column(children: [
            CategoryHorizontalSlider(),
            CategoryHorizontalSlider(),
            CategoryHorizontalSlider(),
            CategoryHorizontalSlider()
          ]);
        }, childCount: 1))
      ],
    ));
  }
}
