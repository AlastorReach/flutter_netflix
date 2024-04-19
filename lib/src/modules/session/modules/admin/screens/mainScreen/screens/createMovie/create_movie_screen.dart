import 'package:flutter/material.dart';

class CreateMovieScreen extends StatelessWidget {
  const CreateMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text('Create movie Screen'),
        ),
      ],
    );
  }
}
