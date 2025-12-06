import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_spacing.dart';

class SectionHeader extends StatelessWidget {
  final String text;

  const SectionHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Text(text, style: AppTypography.titleMedium),
    );
  }
}
