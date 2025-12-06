import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_colors.dart';

class ProfileRowItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRowItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTypography.body)),
          Text(value, style: AppTypography.bodySecondary),
        ],
      ),
    );
  }
}
