import 'package:flutter/material.dart';
import '../../../theme/app_spacing.dart';
import '../../widgets/query_card.dart';
import '../../widgets/status_badge.dart';

class MyQueriesScreen extends StatelessWidget {
  const MyQueriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      // Top bar matching the HTML: back button + centered title
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? Colors.white70 : Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        centerTitle: true,
        title: Text(
          "My Queries",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        actions: const [SizedBox(width: 48)], // keep title visually centered
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Raise New Query button (full width, rounded-full)
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/raiseQuery"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: isDark ? Colors.white : Colors.black87,
                  foregroundColor: isDark ? Colors.black87 : Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text("Raise New Query"),
                    SizedBox(width: 10),
                    Icon(Icons.add_circle),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Queries list
            Column(
              children: [
                QueryCard(
                  title: "Leaky Faucet in Kitchen",
                  description:
                      "The kitchen sink has been dripping constantly for the last two days. It's getting worse.",
                  statusWidget: const StatusBadge(status: "Open"),
                  date: "Oct 26, 2023",
                  onTap: () {
                    // Open detail or edit flow
                  },
                ),
                const SizedBox(height: 12),
                QueryCard(
                  title: "Heating is not working",
                  description:
                      "The central heating system is not turning on. The thermostat seems to be unresponsive.",
                  statusWidget: const StatusBadge(status: "In Progress"),
                  date: "Oct 24, 2023",
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                QueryCard(
                  title: "Parking Spot Inquiry",
                  description:
                      "Follow up on my application for an additional parking spot that I submitted last week.",
                  statusWidget: const StatusBadge(status: "Resolved"),
                  date: "Oct 15, 2023",
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                QueryCard(
                  title: "Broken light in hallway",
                  description:
                      "The light fixture in the main building hallway on the 3rd floor is out. It's been dark for a few days.",
                  statusWidget: const StatusBadge(status: "Resolved"),
                  date: "Oct 12, 2023",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
