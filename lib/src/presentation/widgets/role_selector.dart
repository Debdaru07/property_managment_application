import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class RoleSelector extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String) onSelect;

  const RoleSelector({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(.08) : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children:
            items.map((item) {
              final bool selected = item == selectedItem;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onSelect(item),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          selected
                              ? (isDark
                                  ? Colors.white.withOpacity(.9)
                                  : Colors.white)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow:
                          selected
                              ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.12),
                                  blurRadius: 4,
                                ),
                              ]
                              : null,
                    ),
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            selected
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
