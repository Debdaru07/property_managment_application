import 'package:flutter/material.dart';
import 'src/presentation/screens/auth/login_screen.dart';
import 'src/presentation/screens/employee/employee_dashboard.dart';
import 'src/presentation/screens/landlord/landlord_dashboard.dart';
import 'src/presentation/screens/profile/profile_screen.dart';
import 'src/presentation/screens/queries/my_queries_screen.dart';
import 'src/presentation/screens/queries/raise_new_query_screen.dart';
import 'src/presentation/screens/tenant/dashboard_screen.dart';
import 'src/presentation/screens/tenant/rent_details_screen.dart';
import 'src/presentation/screens/tenant/service_request_form.dart';
import 'src/presentation/screens/tenant/services_screen.dart';
import 'src/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  static const String profile = "/profile";
  static const String tenantdashboard = "/dashboard";
  static const String rentDetails = "/rentDetails";
  static const String myQueries = "/myQueries";
  static const String raiseQuery = "/raiseQuery";
  static const String homeServices = "/homeServices";
  static const String requestService = "/requestService";

  // employee :-
  static const String employeeDashboard = "/employeeDashboard";
  // landlord :-
  static const String landlordDashboard = "/landlordDashboard";

  static Map<String, WidgetBuilder> get map => {
    login: (_) => const LoginScreen(),
    tenantdashboard: (_) => const TenantDashboardScreen(),
    rentDetails: (_) => const RentDetailsScreen(),
    myQueries: (_) => const MyQueriesScreen(),
    raiseQuery: (_) => const RaiseNewQueryScreen(),
    homeServices: (_) => const HomeServicesScreen(),
    requestService: (_) => const RequestServiceScreen(),
    profile: (_) => const ProfileScreen(),
    employeeDashboard: (_) => EmployeeDashboard(),
    landlordDashboard: (_) => LandlordDashboard(),
  };
}
