import 'dart:io';
import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/dropdown_field.dart';
import '../../widgets/text_area.dart';
import '../../widgets/app_text_field.dart';
import '../../../theme/app_spacing.dart';
import 'package:google_fonts/google_fonts.dart';

class RaiseNewQueryScreen extends StatefulWidget {
  const RaiseNewQueryScreen({super.key});

  @override
  State<RaiseNewQueryScreen> createState() => _RaiseNewQueryScreenState();
}

class _RaiseNewQueryScreenState extends State<RaiseNewQueryScreen> {
  final subjectController = TextEditingController();
  final descController = TextEditingController();
  String? category = "Maintenance";

  File? _pickedImage;

  @override
  void dispose() {
    subjectController.dispose();
    descController.dispose();
    super.dispose();
  }

  Future<void> _onPickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (ctx) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Take photo'),
                  onTap: () {
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from gallery'),
                  onTap: () {
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('Cancel'),
                  onTap: () => Navigator.pop(ctx),
                ),
              ],
            ),
          ),
    );
  }

  void _onSubmit() {
    if (subjectController.text.trim().isEmpty ||
        descController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter subject and description')),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Query submitted')));

    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final titleStyle = GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: isDark ? Colors.white : const Color(0xFF1C1C1E),
    );

    final subtitleStyle = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: isDark ? Colors.grey[400] : const Color(0xFF8A8A8E),
    );

    return Scaffold(
      appBar: const AppAppBar(title: "Raise New Query"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Describe your issue or request",
                      style: subtitleStyle,
                    ),
                    const SizedBox(height: 20),

                    AppDropdownField(
                      label: "Query Category",
                      placeholder: "Select category",
                      value: category,
                      items: const [
                        DropdownMenuItem(
                          value: "Maintenance",
                          child: Text("Maintenance"),
                        ),
                        DropdownMenuItem(
                          value: "Rent Issue",
                          child: Text("Rent Issue"),
                        ),
                        DropdownMenuItem(
                          value: "Landlord Issue",
                          child: Text("Landlord Issue"),
                        ),
                        DropdownMenuItem(
                          value: "Document Request",
                          child: Text("Document Request"),
                        ),
                        DropdownMenuItem(value: "Other", child: Text("Other")),
                      ],
                      onChanged: (val) => setState(() => category = val),
                    ),

                    const SizedBox(height: 16),

                    AppTextField(
                      label: "Subject",
                      placeholder: "Short title of your query",
                      controller: subjectController,
                    ),

                    const SizedBox(height: 16),

                    AppTextArea(
                      label: "Description",
                      placeholder: "Explain your issue in detail",
                      controller: descController,
                      maxLines: 8,
                    ),

                    const SizedBox(height: 18),

                    GestureDetector(
                      onTap: _onPickImage,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color:
                                isDark
                                    ? Colors.grey.shade700
                                    : const Color(0xFFD1D1D6),
                          ),
                        ),
                        child: DottedInnerContent(pickedImage: _pickedImage),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            Container(
              color: theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 2,
                    backgroundColor:
                        isDark
                            ? theme.colorScheme.primary
                            : const Color(0xFF1C1C1E),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  child: const Text("Submit Query"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedInnerContent extends StatelessWidget {
  final File? pickedImage;

  const DottedInnerContent({super.key, this.pickedImage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (pickedImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          pickedImage!,
          width: double.infinity,
          height: 140,
          fit: BoxFit.cover,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.add_a_photo,
          size: 36,
          color: isDark ? Colors.grey[400] : const Color(0xFF8A8A8E),
        ),
        const SizedBox(height: 8),
        Text(
          "Add Photo (optional)",
          style: GoogleFonts.inter(
            color: isDark ? Colors.grey[400] : const Color(0xFF8A8A8E),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
