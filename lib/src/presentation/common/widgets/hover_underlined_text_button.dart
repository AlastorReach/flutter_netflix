import 'package:flutter/material.dart';

class HoverUnderlineTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverUnderlineTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  HoverUnderlineTextButtonState createState() =>
      HoverUnderlineTextButtonState();
}

class HoverUnderlineTextButtonState extends State<HoverUnderlineTextButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            decoration:
                _isHovering ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
