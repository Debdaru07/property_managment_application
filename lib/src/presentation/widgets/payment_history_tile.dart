import 'package:flutter/material.dart';
import 'card_base.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

class PaymentHistoryTile extends StatelessWidget {
  final String month;
  final String status;
  final String date;
  final String amount;

  const PaymentHistoryTile({
    super.key,
    required this.month,
    required this.status,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return CardBase(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _statusIcon(status),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(month, style: AppTypography.body),
                  const SizedBox(width: AppSpacing.sm),
                  Text(date, style: AppTypography.bodySecondary),
                ],
              ),
            ],
          ),
          Text(amount, style: AppTypography.titleSmall),
        ],
      ),
    );
  }

  Widget _statusIcon(String status) {
    if (status.toLowerCase() == "paid") {
      return CircleAvatar(
        radius: 20,
        backgroundColor: Colors.green.withOpacity(.1),
        child: const Icon(Icons.check_circle, color: AppColors.success),
      );
    }
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.red.withOpacity(.1),
      child: const Icon(Icons.error, color: AppColors.error),
    );
  }
}
