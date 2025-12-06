import 'package:flutter/material.dart';
import '../../widgets/query_card.dart';
import '../../widgets/app_appbar.dart';
import '../../../theme/app_spacing.dart';

class MyQueriesScreen extends StatelessWidget {
  const MyQueriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "My Queries"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, "/raiseQuery"),
              icon: const Icon(Icons.add_circle),
              label: const Text("Raise New Query"),
            ),

            const SizedBox(height: 16),

            QueryCard(
              title: "Leaky Faucet in Kitchen",
              description: "Sink dripping constantly…",
              status: "Open",
              date: "Oct 26, 2023",
              onTap: () {},
            ),
            const SizedBox(height: 12),

            QueryCard(
              title: "Heating not working",
              description: "Thermostat unresponsive.",
              status: "In Progress",
              date: "Oct 24, 2023",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
