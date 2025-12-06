import 'package:flutter/material.dart';
import '../../../theme/app_spacing.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Role selection values
  final List<String> roles = ["Employee", "Tenant", "Landlord"];
  String selectedRole = "Tenant";

  /// Form controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// If you'd like an app bar, uncomment:
      // appBar: const AppAppBar(title: ""),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              /// Logo area
              const Icon(Icons.domain, size: 48, color: AppColors.textPrimary),
              const SizedBox(height: AppSpacing.sm),
              Text("PropManage", style: AppTypography.titleLarge),

              const SizedBox(height: 32),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Continue as", style: AppTypography.titleMedium),
              ),
              const SizedBox(height: AppSpacing.sm),

              _buildSegmentedRoles(),

              const SizedBox(height: 24),

              /// Email field
              AppTextField(
                label: "Email",
                placeholder: "Enter your email address",
                controller: emailController,
              ),

              const SizedBox(height: AppSpacing.md),

              /// Password field
              AppTextField(
                label: "Password",
                placeholder: "Enter your password",
                controller: passwordController,
                obscure: true,
              ),

              const SizedBox(height: 32),

              /// Login button
              AppButton(text: "Login", onTap: _onLogin),

              const SizedBox(height: 32),

              /// Links
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: AppTypography.bodySecondary.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Contact support",
                  style: AppTypography.bodySecondary.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// HANDLER
  void _onLogin() {
    // Later connect with Bloc
    // context.read<AuthBloc>().add(LoginEvent(email, password, role))
    print("Role: $selectedRole");
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
  }

  /// Segment control widget
  Widget _buildSegmentedRoles() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
      ),
      child: Row(
        children:
            roles.map((role) {
              final isSelected = selectedRole == role;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = role;
                    });
                  },
                  child: Container(
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        AppSpacing.inputRadius,
                      ),
                      boxShadow:
                          isSelected
                              ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ]
                              : null,
                    ),
                    child: Text(
                      role,
                      style: AppTypography.body.copyWith(
                        color:
                            isSelected
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
