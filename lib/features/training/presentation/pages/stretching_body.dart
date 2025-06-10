import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/main_utils.dart';

class StretchingBody extends StatelessWidget {
  const StretchingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              StrechingWidget(
                image: AppImages.splitSchool,
                text: "Split school",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.splitSchool);
                },
              ),
              StrechingWidget(
                isUnlocked: true,
                image: AppImages.healthyBack,
                text: "Healthy Back",
              ),
              StrechingWidget(
                image: AppImages.streching,
                text: "Streching",
                isUnlocked: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
