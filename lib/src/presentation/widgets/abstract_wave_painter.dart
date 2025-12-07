import 'package:flutter/material.dart';

class AbstractWavePainter extends CustomPainter {
  final bool isDarkMode;

  AbstractWavePainter({required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..color =
              isDarkMode
                  ? Colors.white.withOpacity(0.08)
                  : const Color(0xFF141414).withOpacity(0.08);

    final path = Path();

    /// Tailwind SVG Reference:
    /// M0,224L48,208C96,192,192,160,288,165.3C384,171,480,213,576,229.3C672,245,768,235,864,202.7C960,171,1056,117,1152,101.3C1248,85,1344,107,1392,117.3L1440,128L1440,320L0,320Z

    path.moveTo(0, size.height * 0.70);
    path.cubicTo(
      size.width * 0.03,
      size.height * 0.62,
      size.width * 0.12,
      size.height * 0.50,
      size.width * 0.20,
      size.height * 0.52,
    );
    path.cubicTo(
      size.width * 0.27,
      size.height * 0.54,
      size.width * 0.33,
      size.height * 0.66,
      size.width * 0.40,
      size.height * 0.72,
    );
    path.cubicTo(
      size.width * 0.48,
      size.height * 0.78,
      size.width * 0.55,
      size.height * 0.74,
      size.width * 0.62,
      size.height * 0.63,
    );
    path.cubicTo(
      size.width * 0.70,
      size.height * 0.50,
      size.width * 0.80,
      size.height * 0.36,
      size.width * 0.90,
      size.height * 0.32,
    );
    path.cubicTo(
      size.width * 0.98,
      size.height * 0.28,
      size.width * 1.10,
      size.height * 0.34,
      size.width * 1.15,
      size.height * 0.37,
    );

    /// bottom fill
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AbstractWavePainter oldDelegate) => false;
}
