import 'package:flutter/material.dart';
import 'card_base.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardBase(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: AppColors.textPrimary),
          const SizedBox(height: 8),
          Text(title, style: AppTypography.body),
        ],
      ),
    );
  }
}
