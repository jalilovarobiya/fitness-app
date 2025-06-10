import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/training/presentation/pages/body_mind.dart';
import 'package:fitness_app/features/training/presentation/pages/functional_body.dart';
import 'package:fitness_app/features/training/presentation/pages/stretching_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.pink[400],
            labelColor: Colors.pink[400],
            tabs: [
              Tab(text: "Stretching"),
              Tab(text: "Functional"),
              Tab(text: "Body Mind"),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AppImages.paymentWhiteMode),
            ),
          ],
          centerTitle: true,
          title: Text("TrainingPage"),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [StretchingBody(), FunctionalBody(), BodyMind()],
        ),
      ),
    );
  }
}
