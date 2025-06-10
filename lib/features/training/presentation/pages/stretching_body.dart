import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/training/presentation/pages/split_school.dart';
import 'package:fitness_app/features/training/presentation/widgets/streching_widget.dart';
import 'package:flutter/material.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SplitSchool();
                      },
                    ),
                  );
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
