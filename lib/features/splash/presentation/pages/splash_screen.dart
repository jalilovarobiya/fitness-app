import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart' as di;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          await Future.delayed(Duration(seconds: 3));
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          } else if (state is Unauthenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
          }
        },
        child: Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isDark ? AppImages.darkSplash : AppImages.lightSplash,
                ),
              ),
            ),
            child: Center(child: Text("data")),
          ),
        ),
      ),
    );
  }
}
