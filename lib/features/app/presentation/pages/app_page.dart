import 'package:fitness_app/core/utils/main_utils.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
