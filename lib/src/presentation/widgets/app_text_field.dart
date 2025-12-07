import 'package:flutter/material.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool obscure;
  final Widget? suffix;

  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.obscure = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.grey.shade600 : const Color(0xFFE0E0E0);

    OutlineInputBorder border(Color c) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: c, width: 1),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.label),
        const SizedBox(height: AppSpacing.sm),

        SizedBox(
          height: 56,
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: AppTypography.body.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTypography.bodySecondary.copyWith(fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 18,
              ),
              suffixIcon: suffix,
              border: border(borderColor),
              enabledBorder: border(borderColor),
              focusedBorder: border(
                isDark ? Colors.white : AppColors.textPrimary,
              ),
              filled: true,
              fillColor: isDark ? Colors.white.withOpacity(.05) : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
