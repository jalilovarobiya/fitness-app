import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/auth/presentation/pages/login_page.dart';
import 'package:fitness_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSplash extends StatefulWidget {
  const SignUpSplash({super.key});

  @override
  State<SignUpSplash> createState() => _SignUpSplashState();
}

class _SignUpSplashState extends State<SignUpSplash> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.wallpaper1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 80,
            right: 10,
            left: 10,
            child: Column(
              spacing: 30,
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.register,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Sign up with email",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.facebook),
                    SvgPicture.asset(AppImages.google),
                    SvgPicture.asset(AppImages.apple),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                      child: Text(
                        " Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
