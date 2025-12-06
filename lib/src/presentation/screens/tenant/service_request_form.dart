import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/text_area.dart';
import '../../../theme/app_spacing.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final flatController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Request Service"),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: "Flat / Unit Number",
              placeholder: "Enter your flat number",
              controller: flatController,
            ),
            const SizedBox(height: 16),

            AppTextField(
              label: "Preferred Date & Time",
              placeholder: "Choose date & time",
              controller: dateController,
            ),
            const SizedBox(height: 16),

            AppTextArea(
              label: "Describe the issue",
              placeholder: "Describe your requirement or problem",
              controller: descController,
            ),
            const Spacer(),

            AppButton(text: "Send Request", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
