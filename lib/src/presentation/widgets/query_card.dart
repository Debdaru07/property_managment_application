import 'package:flutter/material.dart';
import 'card_base.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

class QueryCard extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String date;
  final VoidCallback onTap;

  const QueryCard({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardBase(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: AppTypography.titleSmall)),
              _statusTag(status),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(description, style: AppTypography.bodySecondary),
          const SizedBox(height: AppSpacing.sm),
          Text(date, style: AppTypography.bodySecondary),
        ],
      ),
    );
  }

  Widget _statusTag(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(status, style: AppTypography.bodySecondary),
    );
  }
}
