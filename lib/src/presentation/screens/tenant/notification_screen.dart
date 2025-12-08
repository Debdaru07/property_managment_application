import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Color textPrimary =
        isDark ? Colors.white.withOpacity(0.9) : const Color(0xFF141414);
    Color bgCard = isDark ? Colors.white.withOpacity(0.08) : Colors.white;
    Color borderColor = isDark ? Colors.grey.shade800 : Colors.grey.shade300;

    return Scaffold(
      appBar: const AppAppBar(title: "Notifications"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Today", isDark),
                  const SizedBox(height: 8),
                  _notificationCard(
                    icon: Icons.receipt_long,
                    title: "Rent Payment Received",
                    time: "10:45 AM",
                    description:
                        "We've received your rent payment of \$1,250 for August. Thank you!",
                    unreadDot: true,
                    bgCard: bgCard,
                    borderColor: borderColor,
                    textPrimary: textPrimary,
                    isDark: isDark,
                  ),
                  const SizedBox(height: 12),
                  _notificationCard(
                    icon: Icons.engineering,
                    title: "Maintenance Request",
                    time: "9:15 AM",
                    description:
                        "Your request for the leaky faucet has been assigned to a technician.",
                    unreadDot: false,
                    bgCard: bgCard,
                    borderColor: borderColor,
                    textPrimary: textPrimary,
                    isDark: isDark,
                  ),

                  const SizedBox(height: 28),
                  _sectionTitle("Yesterday", isDark),
                  const SizedBox(height: 8),
                  _notificationCard(
                    icon: Icons.local_shipping,
                    title: "Package Delivered",
                    time: "3:20 PM",
                    description:
                        "A package from Amazon has been delivered to the mailroom.",
                    unreadDot: false,
                    bgCard: bgCard,
                    borderColor: borderColor,
                    textPrimary: textPrimary,
                    isDark: isDark,
                  ),

                  const SizedBox(height: 28),
                  _sectionTitle("Older", isDark),
                  const SizedBox(height: 8),
                  _notificationCard(
                    icon: Icons.campaign,
                    title: "Community Announcement",
                    time: "3d ago",
                    description:
                        "The annual summer BBQ will be held this Saturday. Join us for food and fun!",
                    unreadDot: false,
                    bgCard: bgCard,
                    borderColor: borderColor,
                    textPrimary: textPrimary,
                    isDark: isDark,
                  ),
                  const SizedBox(height: 12),
                  _notificationCard(
                    icon: Icons.event_available,
                    title: "Lease Renewal Reminder",
                    time: "5d ago",
                    description:
                        "Your lease is expiring in 60 days. Please contact the leasing office.",
                    unreadDot: false,
                    bgCard: bgCard,
                    borderColor: borderColor,
                    textPrimary: textPrimary,
                    isDark: isDark,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: isDark ? Colors.grey[500] : Colors.grey[500],
        ),
      ),
    );
  }

  Widget _notificationCard({
    required IconData icon,
    required String title,
    required String time,
    required String description,
    required bool unreadDot,
    required Color bgCard,
    required Color borderColor,
    required Color textPrimary,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: (isDark ? Colors.white10 : Colors.black.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: textPrimary, size: 22),
          ),
          const SizedBox(width: 14),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: isDark ? Colors.grey[300] : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          if (unreadDot)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 6),
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
