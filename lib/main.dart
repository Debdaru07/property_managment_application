import 'package:flutter/material.dart';
import 'src/presentation/screens/auth/login_screen.dart';
import 'src/theme/app_theme.dart';

/// NOTE:
/// If you plan to use dependency injection,
/// uncomment the await init() line.
/// import 'src/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup DI (if needed now or later)
  /// await init();

  runApp(const PropertyManagementApp());
}

class PropertyManagementApp extends StatelessWidget {
  const PropertyManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PropManage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // or system
      initialRoute: Routes.login,
      routes: Routes.map,
    );
  }
}

/// Navigation + Routing
class Routes {
  static const String login = "/login";
  static const String dashboard = "/dashboard";
  static const String rentDetails = "/rentDetails";
  static const String myQueries = "/myQueries";
  static const String raiseQuery = "/raiseQuery";
  static const String homeServices = "/homeServices";
  static const String requestService = "/requestService";

  static Map<String, WidgetBuilder> get map => {
    login: (_) => const LoginScreen(),
    // The rest will be added when screens are done:
    // dashboard: (_) => const TenantDashboardScreen(),
    // rentDetails: (_) => const RentDetailsScreen(),
    // myQueries: (_) => const MyQueriesScreen(),
    // raiseQuery: (_) => const RaiseNewQueryScreen(),
    // homeServices: (_) => const HomeServicesScreen(),
    // requestService: (_) => const RequestServiceScreen(),
  };
}
