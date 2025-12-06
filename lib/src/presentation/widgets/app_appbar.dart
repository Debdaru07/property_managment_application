import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canGoBack;
  final VoidCallback? onBack;

  const AppAppBar({
    super.key,
    required this.title,
    this.canGoBack = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title, style: AppTypography.titleMedium),
      leading:
          canGoBack
              ? IconButton(
                icon: const Icon(AppIcons.back),
                color: AppColors.textPrimary,
                onPressed: onBack ?? () => Navigator.pop(context),
              )
              : const SizedBox.shrink(),
      actions: const [SizedBox(width: 48)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
