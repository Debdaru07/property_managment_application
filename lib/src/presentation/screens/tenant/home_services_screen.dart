import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';
import 'home_service_request_form.dart';

class HomeServicesScreen extends StatelessWidget {
  const HomeServicesScreen({super.key});

  void _openServiceForm(
    BuildContext context,
    String serviceName,
    IconData icon,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => RequestServiceScreen(
              serviceName: serviceName,
              serviceIcon: icon,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const AppAppBar(title: "Home Services"),

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
                        _serviceCard(context, "Plumber", Icons.plumbing),
                        _serviceCard(
                          context,
                          "Electrician",
                          Icons.electrical_services,
                        ),
                        _serviceCard(context, "Carpenter", Icons.carpenter),
                        _serviceCard(
                          context,
                          "Cleaner",
                          Icons.cleaning_services,
                        ),
                        _serviceCard(context, "Painter", Icons.format_paint),
                        _serviceCard(context, "AC Repair", Icons.ac_unit),
                        _serviceCard(
                          context,
                          "Pest Control",
                          Icons.pest_control,
                        ),
                        _serviceCard(
                          context,
                          "RO/Water Filter",
                          Icons.water_drop,
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

  Widget _serviceCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () => _openServiceForm(context, title, icon),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.black),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTypography.body.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
