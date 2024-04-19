import 'package:flutter/material.dart';

class IconHoverExpanded extends StatefulWidget {
  final Widget child;

  const IconHoverExpanded({super.key, required this.child});
  @override
  IconHoverDemoState createState() => IconHoverDemoState();
}

class IconHoverDemoState extends State<IconHoverExpanded> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            _scale = 1.3;
          });
        },
        onExit: (_) {
          setState(() {
            _scale = 1;
          });
        },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: _scale,
          child: widget.child,
        ));
  }
}
