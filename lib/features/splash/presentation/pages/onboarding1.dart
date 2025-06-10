import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/splash/presentation/pages/onboarding2.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 223, 223),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.onboarding1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      "Welcome to TOPSTRETCHING. Are you ready for a new level of your flexibility?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Now you are a member of our team and we will help you to become healthier, stronger and more flexible. We have a variety of programs in different directions. Here you can track your progress and achieve new goals!",
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.onboarding2);
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
