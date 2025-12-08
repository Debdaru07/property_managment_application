import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/service_card.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';

class HomeServicesScreen extends StatelessWidget {
  const HomeServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const AppAppBar(title: "Home Services"), // BACK BUTTON + TITLE

      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuC5SOHqY5_E7ztayaKXq45RQ6dJCqzKfxp2EhsWZD6Cswah8Sre-vVWpBOMeWbC4I9gf0UC4-gS16xxbi9222eYFujA-aeYBrid53CbyQzgkT5w9PEAkevQ8ifPXvZllCNs5KdPqUHiLCIDjjhql8K5Kq7ppfAu5UVvOk8jrWQoh85nETO3JvVFesXdxTcAtE-kaVqieY0HShLR0YoUsz0ZN9G9YZ7-IRb4xGEej4qR2VgVgSZSuPqc2Vq4eabsnkpjfQK50txmpTg',
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  const SizedBox(height: 4),

                  Text(
                    "Select a service you need",
                    style: AppTypography.bodySecondary,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            isDark
                                ? Colors.grey.shade800
                                : Colors.grey.shade300,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search, size: 20),
                        hintText: "Search services",
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ServiceCard(
                          title: "Plumber",
                          icon: Icons.plumbing,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "Electrician",
                          icon: Icons.electrical_services,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "Carpenter",
                          icon: Icons.carpenter,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "Cleaner",
                          icon: Icons.cleaning_services,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "Painter",
                          icon: Icons.format_paint,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "AC Repair",
                          icon: Icons.ac_unit,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "Pest Control",
                          icon: Icons.pest_control,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                        ServiceCard(
                          title: "RO/Water Filter",
                          icon: Icons.water_drop,
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                "/requestService",
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
