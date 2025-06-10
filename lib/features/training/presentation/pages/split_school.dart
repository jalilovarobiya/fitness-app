import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/training/presentation/widgets/streching_widget.dart';
import 'package:flutter/material.dart';

class SplitSchool extends StatelessWidget {
  const SplitSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Split school")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              StrechingWidget(image: AppImages.fontsplit, text: "Font Split"),
              StrechingWidget(
                image: AppImages.middlesplit,
                text: "Middle Split",
              ),
              StrechingWidget(
                image: AppImages.topstreching,
                text: "Top Streching",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
