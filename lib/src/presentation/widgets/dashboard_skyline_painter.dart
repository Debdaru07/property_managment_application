import 'dart:math';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CitySkylinePainter extends CustomPainter {
  final Random _rand = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.border.withOpacity(0.15)
          ..style = PaintingStyle.fill;

    double x = 0;

    while (x < size.width) {
      double buildingWidth = 20 + _rand.nextDouble() * 40;
      double buildingHeight = 60 + _rand.nextDouble() * 120;

      Rect building = Rect.fromLTRB(
        x,
        size.height - buildingHeight,
        x + buildingWidth,
        size.height,
      );

      canvas.drawRect(building, paint);

      x += buildingWidth + (4 + _rand.nextDouble() * 12);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
