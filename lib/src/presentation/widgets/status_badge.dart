import 'package:flutter/material.dart';

/// A small reusable status badge. Keeps a subtle border + text, easy to read.
class StatusBadge extends StatelessWidget {
  final String status;
  final double radius;
  final EdgeInsets padding;

  const StatusBadge({
    super.key,
    required this.status,
    this.radius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  });

  Color _textColor(String s, bool isDark) {
    final key = s.toLowerCase();
    if (key.contains("open")) {
      return isDark ? Colors.orange.shade200 : Colors.orange.shade800;
    }
    if (key.contains("progress")) {
      return isDark ? Colors.yellow.shade200 : Colors.orange.shade700;
    }
    if (key.contains("resolved") || key.contains("completed")) {
      return isDark ? Colors.green.shade200 : Colors.green.shade700;
    }
    return isDark ? Colors.grey.shade200 : Colors.grey.shade700;
  }

  Color _borderColor(String s, bool isDark) {
    final key = s.toLowerCase();
    if (key.contains("open")) {
      return isDark
          ? Colors.orange.shade400.withOpacity(0.2)
          : Colors.grey.shade300;
    }
    if (key.contains("progress")) {
      return isDark
          ? Colors.yellow.shade400.withOpacity(0.2)
          : Colors.grey.shade300;
    }
    if (key.contains("resolved") || key.contains("completed")) {
      return isDark
          ? Colors.green.shade400.withOpacity(0.2)
          : Colors.grey.shade300;
    }
    return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = _textColor(status, isDark);
    final borderColor = _borderColor(status, isDark);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}
