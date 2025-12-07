import 'package:flutter/material.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/service_card.dart';
import '../../widgets/card_base.dart';
import '../../widgets/section_header.dart';

class TenantDashboardScreen extends StatelessWidget {
  const TenantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome back,", style: AppTypography.bodySecondary),
                      Text(
                        "Brooklyn Simmons",
                        style: AppTypography.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Landlord card
              CardBase(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Landlord", style: AppTypography.bodySecondary),
                        Text("John Doe", style: AppTypography.titleSmall),
                        Text(
                          "+1 (555) 123-4567",
                          style: AppTypography.bodySecondary,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.call),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Rent cards
              Row(
                children: [
                  Expanded(
                    child: CardBase(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.receipt_long, size: 20),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Rent Details",
                                    style: AppTypography.body,
                                  ),
                                ],
                              ),
                              const Icon(Icons.expand_more),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text("₹1,25,000", style: AppTypography.titleMedium),
                          Text(
                            "Due Dec 15",
                            style: AppTypography.bodySecondary,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: CardBase(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.error,
                                color: AppColors.error,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Rent Overdue",
                                style: AppTypography.body.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text("₹20,000", style: AppTypography.titleMedium),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const SectionHeader(text: "Services & Requests"),

              /// Grid
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: .95,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  ServiceCard(
                    title: "Home Services",
                    icon: Icons.home_repair_service,
                    onTap: () => Navigator.pushNamed(context, "/homeServices"),
                  ),
                  ServiceCard(
                    title: "Raise Query",
                    icon: Icons.help_outline,
                    onTap: () => Navigator.pushNamed(context, "/raiseQuery"),
                  ),
                  ServiceCard(
                    title: "My Queries",
                    icon: Icons.confirmation_number,
                    onTap: () => Navigator.pushNamed(context, "/myQueries"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
