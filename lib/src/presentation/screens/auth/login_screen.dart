import 'dart:developer' as console;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Wave background
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CustomPaint(
                  painter: AbstractWavePainter(
                    isDarkMode: Theme.of(context).brightness == Brightness.dark,
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  /// Logo
                  Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.domain,
                          size: 48,
                          color: AppColors.textPrimary,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "PropManage",
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    "Continue as",
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  RoleSelector(
                    items: roles,
                    selectedItem: selectedRole,
                    onSelect: (val) => setState(() => selectedRole = val),
                  ),

                  const SizedBox(height: 28),

                  AppTextField(
                    label: "Email",
                    placeholder: "Enter your email address",
                    controller: emailController,
                  ),

                  const SizedBox(height: 20),

                  AppTextField(
                    label: "Password",
                    placeholder: "Enter your password",
                    controller: passwordController,
                    obscure: true,
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

                  AppButton(text: "Login", onTap: _onLogin),

                  const SizedBox(height: 32),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Contact support",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    Navigator.pushReplacementNamed(context, "/dashboard");

    console.log("Role: $selectedRole");
    console.log("Email: ${emailController.text}");
    console.log("Password: ${passwordController.text}");
  }
}
