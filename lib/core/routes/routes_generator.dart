import 'package:fitness_app/core/utils/main_utils.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case AppRoutes.onboarding1:
        return MaterialPageRoute(builder: (_) => const Onboarding1());

      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());

      case AppRoutes.signUpSplash:
        return MaterialPageRoute(builder: (_) => const SignUpSplash());

      case AppRoutes.onboarding2:
        return MaterialPageRoute(builder: (_) => const Onboarding2());

      case AppRoutes.splitSchool:
        return MaterialPageRoute(builder: (_) => const SplitSchool());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: Text("Error")),
            body: Center(
              child: Text("Sahifa topilmadi", style: TextStyle(fontSize: 25)),
            ),
          ),
    );
  }
}
