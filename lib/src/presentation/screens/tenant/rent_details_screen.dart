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
      appBar: const AppAppBar(title: "Rent Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Current Summary Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  _row("Current Rent", "₹25,000"),
                  _divider(),
                  _row("Due Date", "05/08/2024"),
                  _divider(),
                  _status("Paid"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text("Payment History", style: AppTypography.titleMedium),

            const SizedBox(height: 12),

            /// History list
            Column(
              children: const [
                PaymentHistoryTile(
                  month: "July 2024",
                  date: "Paid on 05/07/2024",
                  status: "Paid",
                  amount: "₹25,000",
                ),
                SizedBox(height: 12),
                PaymentHistoryTile(
                  month: "June 2024",
                  date: "Paid on 05/06/2024",
                  status: "Paid",
                  amount: "₹25,000",
                ),
                SizedBox(height: 12),
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

  Widget _row(label, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.body),
          Text(value, style: AppTypography.body),
        ],
      ),
    );
  }

  Widget _status(String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Payment Status", style: AppTypography.body),
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
            const SizedBox(width: 6),
            Text(
              value,
              style: AppTypography.body.copyWith(color: AppColors.success),
            ),
          ],
        ),
      ],
    );
  }

  Widget _divider() => Divider(color: AppColors.border);
}
