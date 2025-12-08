import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestServiceScreen extends StatefulWidget {
  final IconData serviceIcon;
  final String serviceName;

  const RequestServiceScreen({
    super.key,
    this.serviceIcon = Icons.plumbing,
    this.serviceName = "Plumber",
  });

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final flatController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  File? pickedImage;

  void _pickImage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Image picker not implemented")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Opacity(
                    opacity: isDark ? 0.10 : 0.05,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuC5SOHqY5_E7ztayaKXq45RQ6dJCqzKfxp2EhsWZD6Cswah8Sre-vVWpBOMeWbC4I9gf0UC4-gS16xxbi9222eYFujA-aeYBrid53CbyQzgkT5w9PEAkevQ8ifPXvZllCNs5KdPqUHiLCIDjjhql8K5Kq7ppfAu5UVvOk8jrWQoh85nETO3JvVFesXdxTcAtE-kaVqieY0HShLR0YoUsz0ZN9G9YZ7-IRb4xGEej4qR2VgVgSZSuPqc2Vq4eabsnkpjfQK50txmpTg",
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "Request Service",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        widget.serviceIcon,
                        size: 48,
                        color: isDark ? Colors.grey[300] : Colors.grey[600],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.serviceName,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Add your details below",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 28),

                      _inputField(
                        controller: flatController,
                        placeholder: "Enter your flat or unit number",
                        isDark: isDark,
                      ),
                      const SizedBox(height: 20),

                      Stack(
                        children: [
                          _inputField(
                            controller: dateController,
                            placeholder: "Choose date & time",
                            isDark: isDark,
                          ),
                          Positioned(
                            right: 12,
                            top: 14,
                            child: Icon(
                              Icons.calendar_today,
                              size: 20,
                              color:
                                  isDark ? Colors.grey[500] : Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      _textArea(
                        controller: descController,
                        placeholder: "Describe your requirement or problem",
                        isDark: isDark,
                      ),
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: _pickImage,
                        child: CustomPaint(
                          painter: DottedBorderPainter(
                            color:
                                isDark
                                    ? Colors.grey.shade600
                                    : Colors.grey.shade400,
                            strokeWidth: 2,
                            radius: 12,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.photo_camera,
                                  size: 36,
                                  color:
                                      isDark
                                          ? Colors.grey[500]
                                          : Colors.grey[400],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Add Photo (optional)",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                child: SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Send Request"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String placeholder,
    required bool isDark,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: isDark ? Colors.grey[850] : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _textArea({
    required TextEditingController controller,
    required String placeholder,
    required bool isDark,
  }) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: isDark ? Colors.grey[850] : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final dashWidth = 6.0;
    final dashSpace = 4.0;

    final path = Path()..addRRect(rrect);
    final totalLength = path.computeMetrics().fold(
      0.0,
      (sum, m) => sum + m.length,
    );

    double distance = 0.0;
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final extract = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extract, paint);
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
