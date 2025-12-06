import 'package:flutter/material.dart';
import '../../widgets/app_appbar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/dropdown_field.dart';
import '../../widgets/text_area.dart';
import '../../widgets/app_text_field.dart';
import '../../../theme/app_spacing.dart';

class RaiseNewQueryScreen extends StatefulWidget {
  const RaiseNewQueryScreen({super.key});

  @override
  State<RaiseNewQueryScreen> createState() => _RaiseNewQueryScreenState();
}

class _RaiseNewQueryScreenState extends State<RaiseNewQueryScreen> {
  final subjectController = TextEditingController();
  final descController = TextEditingController();
  String? category = "Maintenance";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Raise New Query"),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
            const Spacer(),

            AppButton(text: "Submit Query", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
