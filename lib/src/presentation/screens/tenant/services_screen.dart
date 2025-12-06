import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/service_card.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';

class HomeServicesScreen extends StatelessWidget {
  const HomeServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Home Services"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a service you need",
              style: AppTypography.bodySecondary,
            ),

            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                ServiceCard(
                  title: "Plumber",
                  icon: Icons.plumbing,
                  onTap: () => Navigator.pushNamed(context, "/requestService"),
                ),
                ServiceCard(
                  title: "Electrician",
                  icon: Icons.electrical_services,
                  onTap: () => Navigator.pushNamed(context, "/requestService"),
                ),
                ServiceCard(
                  title: "Carpenter",
                  icon: Icons.carpenter,
                  onTap: () => Navigator.pushNamed(context, "/requestService"),
                ),
                ServiceCard(
                  title: "Cleaner",
                  icon: Icons.cleaning_services,
                  onTap: () => Navigator.pushNamed(context, "/requestService"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
