import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/training/presentation/widgets/streching_widget.dart';
import 'package:flutter/material.dart';

class FunctionalBody extends StatelessWidget {
  const FunctionalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              StrechingWidget(image: AppImages.isolation, text: "ISOLATION"),
              StrechingWidget(
                isUnlocked: true,
                image: AppImages.hiit,
                text: "HIIT",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
