import 'package:flutter/material.dart';
import '../../widgets/payment_history_tile.dart';
import '../../widgets/app_appbar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_colors.dart';

class RentDetailsScreen extends StatelessWidget {
  const RentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: const AppAppBar(title: "Rent Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _summaryCard(),

            const SizedBox(height: AppSpacing.lg),

            Text(
              "Payment History",
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3,
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            Column(
              children: const [
                PaymentHistoryTile(
                  month: "July 2024",
                  date: "Paid on 05/07/2024",
                  status: "Paid",
                  amount: "₹25,000",
                ),
                SizedBox(height: AppSpacing.sm),
                PaymentHistoryTile(
                  month: "June 2024",
                  date: "Paid on 05/06/2024",
                  status: "Paid",
                  amount: "₹25,000",
                ),
                SizedBox(height: AppSpacing.sm),
                PaymentHistoryTile(
                  month: "May 2024",
                  date: "Overdue by 3 days",
                  status: "Overdue",
                  amount: "₹25,000",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _row("Current Rent", "₹25,000"),
          _divider(),
          _row("Due Date", "05/08/2024"),
          _divider(),
          _statusRow(),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodySecondary.copyWith(fontSize: 14),
          ),
          Text(
            value,
            style: AppTypography.body.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _statusRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Payment Status",
            style: AppTypography.bodySecondary.copyWith(fontSize: 14),
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Paid",
                style: AppTypography.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Divider(color: AppColors.border.withOpacity(0.7), thickness: 0.75),
  );
}
