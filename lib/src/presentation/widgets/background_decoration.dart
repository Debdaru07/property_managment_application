import 'package:flutter/material.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final double opacity;

  const BackgroundDecoration({
    super.key,
    required this.child,
    this.opacity = 0.05,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/skyline.png', fit: BoxFit.cover),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
