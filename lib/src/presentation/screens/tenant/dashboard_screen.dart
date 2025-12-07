import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import '../../widgets/card_base.dart';
import '../../widgets/service_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/dashboard_skyline_painter.dart';
import '../../../../main.dart';

class TenantDashboardScreen extends StatelessWidget {
  const TenantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImageUrl =
        "https://plus.unsplash.com/premium_photo-1664298528358-790433ba0815?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Stack(
          children: [
            /// Skyline background at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 180, // skyline height
                child: CustomPaint(painter: CitySkylinePainter()),
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header: Avatar, greeting, notification
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      Routes.profile,
                                    ),
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.border),
                                  ),
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                      profileImageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome back,",
                                    style: AppTypography.bodySecondary,
                                  ),
                                  Text(
                                    "Brooklyn Simmons",
                                    style: AppTypography.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          /// Notification button - black circular
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(999),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.textPrimary,
                                  child: const Icon(
                                    Icons.notifications_none,
                                    size: 22,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.error,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.backgroundGrey,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    /// Landlord Card
                    CardBase(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Landlord",
                                style: AppTypography.bodySecondary,
                              ),
                              Text("John Doe", style: AppTypography.titleSmall),
                              Text(
                                "+1 (555) 123-4567",
                                style: AppTypography.bodySecondary,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(999),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.primary.withOpacity(
                                0.15,
                              ),
                              child: const Icon(
                                Icons.call,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    /// Rent cards row - same height
                    Row(
                      children: [
                        Expanded(
                          child: CardBase(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            constraints: const BoxConstraints(
                              minHeight: AppSpacing.dashboardCardMinHeight,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.receipt_long,
                                          size: 20,
                                          color: AppColors.primary,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "Rent Details",
                                          style: AppTypography.body,
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      size: 20,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "₹1,25,000",
                                  style: AppTypography.titleLarge,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Due Dec 15",
                                  style: AppTypography.bodySecondary,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: AppSpacing.md),

                        Expanded(
                          child: CardBase(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            constraints: const BoxConstraints(
                              minHeight: AppSpacing.dashboardCardMinHeight,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.error,
                                      size: 20,
                                      color: AppColors.error,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Rent Overdue",
                                      style: AppTypography.body.copyWith(
                                        color: const Color(0xFFFF6347),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "₹20,000",
                                  style: AppTypography.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Services header
                    const SizedBox(height: AppSpacing.md),
                    const SectionHeader(text: "Services & Requests"),

                    /// Services grid
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      children: [
                        ServiceCard(
                          title: "Home Services",
                          icon: Icons.home_repair_service,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                Routes.homeServices,
                              ),
                        ),
                        ServiceCard(
                          title: "Raise a Query",
                          icon: Icons.help_outline,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                Routes.raiseQuery,
                              ),
                        ),
                        ServiceCard(
                          title: "My Queries",
                          icon: Icons.confirmation_number,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                Routes.myQueries,
                              ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
