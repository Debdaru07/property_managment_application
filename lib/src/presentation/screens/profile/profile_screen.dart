import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import '../../widgets/profile_info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            /// Top Header
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                border: Border(
                  bottom: BorderSide(color: AppColors.border.withOpacity(.4)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Back Button
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                    ),
                  ),

                  /// Title
                  Text("Profile", style: AppTypography.titleMedium),

                  /// Placeholder for spacing balance
                  const SizedBox(width: 40),
                ],
              ),
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Avatar + Name
                    Column(
                      children: [
                        Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceGrey,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.home,
                            size: 40,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          "Brooklyn Simmons",
                          style: AppTypography.titleLarge,
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    /// Info List
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                      ),
                      child: Column(
                        children: const [
                          ProfileInfoRow(
                            label: "Name",
                            value: "Brooklyn Simmons",
                          ),
                          ProfileInfoRow(
                            label: "Email",
                            value: "brooklyn.s@example.com",
                          ),
                          ProfileInfoRow(
                            label: "Phone Number",
                            value: "(555) 234-5678",
                          ),
                          ProfileInfoRow(
                            label: "Tenant ID",
                            value: "TID-987654",
                          ),
                          ProfileInfoRow(
                            label: "Property Address",
                            value: "123 Main St, Apt 4B",
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Bottom Logout
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.cardRadius,
                      ),
                    ),
                  ),
                  onPressed:
                      () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.login,
                        (route) => false,
                      ),
                  child: Text(
                    "Logout",
                    style: AppTypography.button.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
