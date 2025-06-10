import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/splash/presentation/pages/sign_up_splash.dart';
import 'package:fitness_app/features/splash/presentation/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isSelected = false;
  bool isSelected2 = false;

  bool get canCantinue => isSelected && isSelected2;

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
              spacing: 25,
              children: [
                Text(
                  "Start practicingthe best workout programs based on your goals",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                  ),
                ),
                RowWidget(
                  text:
                      "I agree to the processing of my personal data according to Privacy Policy (including, to sharing my personal data with third parties)",
                  isSelected: isSelected2,
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                ),
                RowWidget(
                  text: "I accept the Terms and Conditions of Use",
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        canCantinue
                            ? () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.signUpSplash,
                              );
                            }
                            : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canCantinue ? Colors.green : Colors.grey,
                    ),
                    child: Text("Continue"),
                  ),
                ),
                Text(
                  "By tapping Continue you agree to the Privacy Policy and Terms and Conditions of Use",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
