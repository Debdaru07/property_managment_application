import 'package:flutter/material.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_colors.dart';

class CardBase extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CardBase({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        child: child,
      ),
    );
  }
}
