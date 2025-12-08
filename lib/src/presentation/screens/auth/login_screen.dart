import 'dart:developer' as console;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../main.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/role_selector.dart';
import '../../widgets/abstract_wave_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<String> roles = ["Employee", "Tenant", "Landlord"];
  String selectedRole = "Tenant";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Visual sizes to match Tailwind example
    const double logoSize = 48;
    const double headerTop = 64; // pt-16 (approx)
    const double headerBottom = 48; // pb-12
    const double maxContentWidth =
        420; // slightly less than 480 to match max-w-sm feel
    const double roleHeight = 40; // h-10
    const double buttonHeight = 56;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Wave background (keeps existing painter)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CustomPaint(
                  painter: AbstractWavePainter(isDarkMode: isDark),
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: headerTop),

                      // Logo + App name
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.domain,
                              size: logoSize,
                              color: AppColors.textPrimary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "PropManage",
                              style: GoogleFonts.inter(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: headerBottom),

                      // "Continue as"
                      Text(
                        "Continue as",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Role selector container to match segmented style
                      Container(
                        height: roleHeight,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:
                              isDark
                                  ? AppColors.backgroundDark
                                  : const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RoleSelector(
                          items: roles,
                          selectedItem: selectedRole,
                          onSelect: (val) => setState(() => selectedRole = val),
                          // If RoleSelector supports custom height/text style, it will pick it up.
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Email
                      AppTextField(
                        label: "Email",
                        placeholder: "Enter your email address",
                        controller: emailController,
                        // ensure text style matches
                      ),

                      const SizedBox(height: 20),

                      // Password with trailing visibility control sized to match design
                      AppTextField(
                        label: "Password",
                        placeholder: "Enter your password",
                        controller: passwordController,
                        obscure: !isPasswordVisible,
                        suffix: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed:
                              () => setState(
                                () => isPasswordVisible = !isPasswordVisible,
                              ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Login button that fills width and matches design height
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: AppButton(text: "Login", onTap: _onLogin),
                      ),

                      const SizedBox(height: 130),

                      // Footer links centered
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password?",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.backgroundDark,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Contact support",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.backgroundDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    // route based on selected role
    switch (selectedRole) {
      case "Employee":
        Navigator.pushReplacementNamed(context, Routes.employeeDashboard);
        break;
      case "Landlord":
        Navigator.pushReplacementNamed(context, Routes.landlordDashboard);
        break;
      case "Tenant":
      default:
        Navigator.pushReplacementNamed(context, Routes.tenantdashboard);
        break;
    }

    console.log("Role: $selectedRole");
    console.log("Email: ${emailController.text}");
    console.log("Password: ${passwordController.text}");
  }
}
