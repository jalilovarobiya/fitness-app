import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/main_utils.dart';

class BodyMind extends StatelessWidget {
  const BodyMind({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              StrechingWidget(image: AppImages.yoga, text: "Yoga & pilates"),
              StrechingWidget(
                isUnlocked: true,
                image: AppImages.relaxation,
                text: "Relaxation",
              ),
              StrechingWidget(
                isUnlocked: true,
                image: AppImages.facebuilding,
                text: "Facebuilding",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
